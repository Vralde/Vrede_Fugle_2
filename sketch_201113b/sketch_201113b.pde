
float x;
float y;
float g = 9.82;
float v0;
float y0 = 0;
float t;
float m = 1;
float u0;
float A;
float E;
float alpha = PI/4;
float L = 2;


void setup(){
 size(1000, 800);
 background (0, 0, 0);
  
}


void draw(){
  clear();
  if(mousePressed == true){
    opdaterFysiskVerden();
    
    fill(255, 255, 255);
    circle(x, y, 20);
     
    println(x, y);
  }
}



void opdaterFysiskVerden(){
     t = t + 0.2;
   if(y >= 0){
     
     A = sin(alpha);
     E = 50 * L * L;
     
     
     u0 = sqrt((2 * E)/(m * (1 + A * A)));
     v0 = A * sqrt((2 * E)/(m * (1 + A * A)));
     y = y * (-1);

     
     x = u0 * t;
     y = -0.5 * g * t * t + v0 * t + y0;
     

   }
}
