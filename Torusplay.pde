import peasy.*;

PeasyCam cam;
HScrollbar hs1, hs2;

int n=60;
int k=10;
int R=200;

float t=0;
float dt=0.01;

void settings() {
  size(1200, 800, P3D);
}



void setup() {  
  colorMode(HSB);
  //cam = new PeasyCam(this, 600);
  hs1 = new HScrollbar(0, height-60, width, 16, 16);
  hs2 = new HScrollbar(0, height-20, width, 16, 16);

  frameRate(60);
}


void draw() {
  background(0); 
  noFill();
  
    hs1.update();
   hs1.display();
   hs2.update();
   hs2.display();
   
  colorMode(HSB);
  stroke(255);
  translate(width/2,height/2,200);

  rotateX(PI/3);
println(hs1.getPos());

  torus(min(4,floor(hs2.getPos()/2)), 200, 400/hs1.getPos(), k);


  t+=dt;
}


void torus(int level, float radius, float nextRadius, int k) {
  int l=level-1;

  pushMatrix();


  stroke(20*level, 255, 255, map(radius, 5,300,50,200));    noFill();   strokeWeight(map(hs2.getPos(), 0,11, 30,4));


  if (level>0) {
   // circle(0,0,radius*2);
   // torus(l, radius, radius/9, k*2);
    rotateX(PI/2);

    float a=2*PI/k;
    rotateY(t*100/radius);

    for (int i=0; i<k; i++) {
      rotateY(a);
      translate(radius, 0);
//       point(0, 0);

      torus(l, nextRadius, nextRadius/3, k);
      translate(-radius, 0);
    }
  }else{
    circle(0,0,radius*2);
    
  }
  popMatrix();
}


/*
void ring(float x, float y) {
  pushMatrix();
  translate(x, y);
  // rotate(2*t);

  float a=2*PI/n;
  for (int i=0; i<n; i++) {
    rotateZ(a);
    point(R, 0);
  }

  popMatrix();
}
*/
