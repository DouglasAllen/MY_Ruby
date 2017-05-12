
%w(rack tilt backports).map do |lib|
  require lib
end
%w(INT TERM).map do |sig|
  trap(sig) { $r.stop }
end

Sinatra = Module.new do
  a = (Application = Rack::Builder.new)
  D = Object.method(:define_method)
  S = /@@ *([^\n]+)\n(((?!@@)[^\n]*\n)*)/m
  $p = 4567
  q = a
  %w(get post put delete).map do |meth|
    D.call(meth) do |path, &block|
      a.map(path) do
        response_app = lambda do |_env|
          [
            200,
            { 'Content-Type' => 'text/html' },
            [a.instance_eval(&block)]
          ]
        end
        run(response_app)
      end
    end
  end
  Tilt.default_mapping do |k, v|
    D.call(k) do |n, *o|
      h = {}
      app_file = File.read(caller[0][/^[^:]+/])
      app_file.scan(S) { |a, b| h[a] = b }
      $t ||= h
      template_engine = v.first
      template_engine.new(*o) do
        n.to_s == n ? n : $t[n.to_s]
      end.render(
        a,
        (o[0].try(:[], :locals) || {})
      )
    end
  end
  %w(set enable disable configure helpers use register).each do |m|
    D.call(m) { |*_, &b| b.try :call }
  end
  END {
    Rack::Handler.get('webrick').run(a, Port: $p) { |s| $r = s }
  }
  %w(params session).each do |m|
    D.call(m) { q.send m }
  end
  a.use Session::Cookie
  a.use Lock
  D.call(:before) { |&b| a.use Rack::Config, &b }
  before do |e|
    q = Request.new e
    q.params.dup.map { |k, v| params[k.to_sym] = v }
  end
end
$n = Sinatra
puts "== almost #{$n}/No Version has taken the stage on #{$p} for development with backup from Webrick"
