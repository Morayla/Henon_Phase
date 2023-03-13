// number of points to draw in each iteration
float scale = 2;      // scale the visualization to match the applet size
float a = random(TWO_PI);
int cnt;
int maxnum = 5000;

TravelerHenon[] travelers = new TravelerHenon[maxnum];

color[] goodcolor = {#000000, #6b6556, #a09c84, #908b7c, #79746e, #755d35, #937343, #9c6b4b, #ab8259, #aa8a61, #578375, #f0f6f2, #d0e0e5, #d7e5ec, #d3dfea, #c2d7e7, #a5c6e3, #a6cbe6, #adcbe5, #77839d, #d9d9b9, #a9a978, #727b5b, #6b7c4b, #546d3e, #47472e, #727b52, #898a6a, #919272, #AC623b, #cb6a33, #9d5c30, #843f2b, #652c2a, #7e372b, #403229, #47392b, #3d2626, #362c26, #57392c, #998a72, #864d36, #544732 };
color somecolor() {
  // pick some random good color
  return goodcolor[int(random(goodcolor.length))];
}


void newHenon() {
  background(0);
  a = random(TWO_PI);
  for (int i=0; i<maxnum; i++) {
    travelers[i].reset();
  }
}

void setup()
{
  size(1000, 1000);
  pixelDensity(2);
  
  background(0);

  // make some travelers
  for (int i=0; i<maxnum; i++) {
    float tx = random(0,1);
    travelers[i] = new TravelerHenon(tx, 0);
  }
}

void draw()
{
  for (int i=0; i<maxnum; i++) {
    travelers[i].render(10);
  }
}

void keyPressed()
{
   background(255);
}

void mouseClicked()
{
  newHenon();
}

class TravelerHenon {
  float ox, oy;
  float x, y;

  color myc;

  TravelerHenon(float Ox, float Oy) {
    // constructor
    ox = Ox;
    oy = Oy;
    // set travel position
    x = Ox;
    y = Oy;

    // set some good color
    myc = goodcolor[int(random(goodcolor.length))];
    //myc = goodcolor[int(gc+floor(goodcolor.length*ox))%goodcolor.length];
  }

  void draw() {
    float t = x * cos(a) - (y - x*x) * sin(a);
    y = x * sin(a) + (y - x*x) * cos(a);
    x = t;
    // render
    stroke(300-red(myc),255-green(myc),255-blue(myc), 32);
    point((x/scale + .5)*width, (y/scale + .5)*height);
  }


  void render(int maxpoints) {
    for (int i=0; i<maxpoints; i++) {
      draw();
    }
  }

  void reset() {
    x = ox;
    y = oy;
    myc = goodcolor[int(random(goodcolor.length))];
  }
}
