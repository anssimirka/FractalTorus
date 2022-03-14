import peasy.*;

PeasyCam cam;
HScrollbar hs1, hs2;

int k=10;
int R=20;
boolean roll=true;

float t=0;
int cnt=0;
float dt=0.05;
float scl=3;

void settings() {
  size(1200, 800, P3D);
}



void setup() {  
  colorMode(HSB);
  cam = new PeasyCam(this, 600);
  hs1 = new HScrollbar(0, height-60, width, 16, 16);
  hs2 = new HScrollbar(0, height-20, width, 16, 16);

  frameRate(50);
}


void draw() {
  translate(scl*R,0,0);
  if(t>2*k){
    float L= 500/(1+exp(-(t-2.3*k)*5));
      translate(L*1.2,0,-L);
  }
    if(t>3*k){
    float L= 4000/(1+exp(-(t-3.3*k)*5));
      translate(L/2,0,-L);
  }
  
    if(t>5*k){
    float L= 4000/(1+exp(-(t-6*k)));
      translate(-L/10,0,L);
  }
  
  

  
  background(0); 
  noFill();
  /*
  hs1.update();
   hs1.display();
   hs2.update();
   hs2.display();
   */

  colorMode(HSB);
  stroke(255, 100);
  strokeWeight(10);
  noFill();
  //  translate(width/2,height/2,200);

  //rotateX(PI/3);
  //println(hs1.getPos());


  float a= 2*PI/k;

  if (t<k) {
    rotateY(2*PI*t/k);
    translate(scl*R, 0);
    circle(0, 0, R);
    translate(-scl*R, 0);
    rotateY(-2*PI*t/k);
  
  for (int i=0; i<min(t, k); i++) {
    translate(scl*R, 0);
    circle(0, 0, R);
    translate(-scl*R, 0);
    rotateY(a);
  }}

  if (t>=k) { 
    translate(-scl*scl*R, 0);

    if ( t<2*k) {
      rotateZ(2*PI*(t-k)/k);
      translate(scl*scl*R, 0);
      phase1(a);
      translate(-scl*scl*R, 0);
      rotateZ(-2*PI*(t-k)/k);

      for (int i=0; i<min(t-k, k); i++) {
        translate(scl*scl*R, 0);

        phase1(a);
        translate(-scl*scl*R, 0);
        rotateZ(a);
      }
    }

    if (t>=2*k) {
      translate(-scl*scl*scl*R, 0);

      if (t<3*k) {
        rotateY(2*PI*(t-2*k)/k);
        translate(scl*scl*scl*R, 0);
        phase2(a);
        translate(-scl*scl*scl*R, 0);
        rotateY(-2*PI*(t-2*k)/k);

        for (int i=0; i<min(t-2*k, k); i++) {
          translate(scl*scl*scl*R, 0);
          phase2(a);
          translate(-scl*scl*scl*R, 0);
          rotateY(a);
        }
      }


      if (t>=3*k) {
        translate(-scl*scl*scl*scl*R, 0);
        if (t<4*k) {
          rotateZ(2*PI*(t-3*k)/k);
          translate(scl*scl*scl*scl*R, 0);
          phase3(a);
          translate(-scl*scl*scl*scl*R, 0);
          rotateZ(-2*PI*(t-3*k)/k);
        }


        for (int w=0; w< min(t-3*k, k); w++) {
          translate(scl*scl*scl*scl*R, 0);
          phase3(a);
          translate(-scl*scl*scl*scl*R, 0);
          rotateZ(a);
        }
      }
    }
  }

  cnt++;
  t+=dt;
}


void phase1(float a) {
  pushMatrix();
  rotateY(t/2);
  for (int j=0; j<k; j++) {
    translate(scl*R, 0);
    circle(0, 0, R);
    translate(-scl*R, 0);
    rotateY(a);
  }

  popMatrix();
}

void phase2(float a) {
  pushMatrix();
  rotateZ(t/4);

  for (int i=0; i< k; i++) {
    translate(scl*scl*R, 0);
    phase1(a);
    translate(-scl*scl*R, 0);
    rotateZ(a);
  }
  popMatrix();
}

void phase3(float a) {
  pushMatrix();
  rotateY(t/8);

  for (int e=0; e< k; e++) {

    translate(scl*scl*scl*R, 0);
    phase2(a);
    translate(-scl*scl*scl*R, 0);
    rotateY(a);
  }
  popMatrix();
}
