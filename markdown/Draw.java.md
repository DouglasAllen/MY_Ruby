
```java
package applets;

// Draw.java
// Big Smiley Applet
import java.applet.Applet;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;

public class Draw extends Applet implements Runnable {

    private Color eyeswhites;
    private Color eyescolor;
    private Color eyespupils;
    private Color face;
    private Color mouth;
    private BasicStroke mouthWidth;

    Thread mythread = null;
    @Override
    public void run(){}

    /* Thread methods */

    @Override
    public void start() {
        if (mythread == null) {
            mythread = new Thread(this);
            mythread.start();
        }
    }

    @Override
    public void stop() {
        if (mythread != null) {
            //mythread.stop();
            mythread = null;
            destroy();
        }
    }

    /* Applet methods */
    @Override
    public void init() {
        //resize(1016, 700);
        //resize(1024, 665);

        try {
            setBackground(new Color(Integer.parseInt(getParameter("bgcolor"),
                    16)));
        } catch (NullPointerException e) {
            System.out.println(e);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        eyeswhites = Color.WHITE;
        eyescolor = Color.BLUE;
        eyespupils = Color.BLACK;
        face = Color.YELLOW;
        mouth = Color.MAGENTA;
    }

    @Override
    public void paint(Graphics g) {
        Graphics2D g2 = (Graphics2D) g;

        // Total screen size
        int sW = getSize().width;
        int sH = getSize().height;

        // Mouth is used as the reference for the Eyes.
        // Center of Eyes are at Mouth ends.
        int mW = getSize().width/4;     // Mouth width
        int mH = getSize().height/6;    // Mouth height

        int fS = mW * 2;                // Face size is twice Mouth width.
        int mL = mW/2 + fS;             // Left mouth starts here.
        int mT = mH/4 + fS/2;           // Top mouth starts here.


        int fL = mW + fS;
        int fT = mH/2 + fS;

        int eS = fS/5;
        int eL = mL + eS/2;
        int eR = eL - mW;
        int eT = eS * 2 + mT;

        int cS = fS/7;
        int cL = mL + cS/2;
        int cR = cL - mW;
        int cT = eT - eS/8;

        int pS = fS/13;
        int pL = mL + pS/2;
        int pR = pL - mW;
        int pT = cT - cS/4;

        System.out.println("width size: " + sW);
        System.out.println("height size: " + sH);
        System.out.println("face size: " + fS);
        System.out.println("eyes size: " + eS);
        System.out.println("eyes color size: " + cS);
        System.out.println("eyes pupils size: " + pS);

        g.setColor(face);
        g.fillOval(sW-fL, sH-fT, fS, fS);
        g.setColor(eyeswhites);
        g.fillOval(sW-eL, sH-eT, eS, eS);
        g.fillOval(sW-eR, sH-eT, eS, eS);
        g.setColor(eyescolor);
        g.fillOval(sW-cL, sH-cT, cS, cS);
        g.fillOval(sW-cR, sH-cT, cS, cS);
        g.setColor(eyespupils);
        g.fillOval(sW-pL, sH-pT, pS, pS);
        g.fillOval(sW-pR, sH-pT, pS, pS);
        g2.setColor(mouth);
        float stroke = eS / 4;
        mouthWidth = new BasicStroke(stroke);
        g2.setStroke(mouthWidth);
        g2.drawArc(sW-mL, sH-mT, mW, mH, 0, -180);

    }

    @Override
    public String[][] getParameterInfo() {
        String[][] info = {
            {"bgcolor", "hexadecimal RGB number",
        "The background color. Default is the color of your browser."
            }

        };

        return info;
    }

}
```
