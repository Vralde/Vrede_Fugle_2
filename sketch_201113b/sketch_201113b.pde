float x;
float y;
float g = 9.82;
float v0;
float x0 = 100;
float y0 = 500;
float t;
float m = 1;
float u0;
float A;
float E;

float a;
float b;
float v;
float L;

boolean fly = false;

float mx;
float my;
//Disse to floats, bruges så fuglen ikke flyver rundt midt i kastet,
//når musen flyttes


void setup(){
 size(1000, 800);
 background (0, 0, 0);
  
}


void draw(){
  clear();
  

  fill(255, 255, 255);
  circle(x0, y0, 20);
  //Denne cirkel forstiller selve slangebøssen.
  
  fill(255, 0, 0);
  circle(x, y, 20);
  //Dette er selve fuglen.
  
  stroke(255);
  fill(255, 255, 255);
  line(mouseX, mouseY, x0, y0);
  //Dette skal være snoren der trækker slangebøssen og fuglen tilbage.
  
  text("a = " + a + "   b = " + b, 10, 10);
  text("mY = " + mouseY + "   mX = " + mouseX, 10, 20);
  text("v = " + degrees(v), 10, 30);
  //Noget simpelt tjekkende kode
  
  a = my - y0;
  b = mx - x0;
  v = atan(a/b);
  L = dist(mx, my, x0, y0);
  //Disse udregninger bruges til udregning af distancen fra musen til fuglens startpunkt, hvilket bruges til affyringshastigheden,
  //De bruges også til udregning af afyringsvinklen.
  
  
  
  if(mousePressed == true){
    mx = mouseX;
    my = mouseY;
    t = 0;
    x = 0;
    y = 0;
    //Disse tre udtryk starter fuglen forfra, hver gang man trykker med musen.
    
    fly = true;
    //Denne funktion er unødvendig, men gør at man kun behøver at trykke en enkelt gang med musen.
  }
  
  if(fly == true){
    opdaterFysiskVerden();
    //En funktion, så den ikke skal skrives igen og igen.

    println(x, y);
    //Feedback kode.
  }

}




void opdaterFysiskVerden(){
   t = t + 0.1;
   //t bliver kun 0,2 større hver frame, så er det nemmere at se fuglen.
   if(y <= 800){
   //Hvis fuglen har ramt jorden, skal den ikke flyve længere.  
     
     if(b > 0){
     //Hvis linjen er "foran" fuglen, bliver fuglen nu skudt bagud
     
       A = sin(v);
       E = 50 * (L/10) * (L/10);
     
       u0 = sqrt((2 * E)/(m * (1 + A * A)));
       v0 = A * sqrt((2 * E)/(m * (1 + A * A)));
     
       x = -(u0 * t) + x0;
       y = 0.5 * g * t * t - v0 * t + y0;
       
     }else if(b == 0){
       //Dette er hvis fuglen bliver skudt 90 grader
      
       A = sin(v);
       E = 50 * (L/10) * (L/10);

       v0 = A * sqrt((2 * E)/(m * (1 + A * A)));
     
       x = x0;
       y = 0.5 * g * t * t - v0 * t + y0;
       
     }else{
       A = sin(v)*2;
       E = 50 * (L/10) * (L/10);
     
       u0 = sqrt((2 * E)/(m * (1 + A * A)));
       v0 = A * sqrt((2 * E)/(m * (1 + A * A)));
     
       x = u0 * t + x0;
       y = 0.5 * g * t * t + v0 * t + y0;
       //I selve koden flyver fuglen opad, det skyldes at 0,5 er i minus. I "fysikkens verden" er koden her korrekt, men da y-aksen går nedaf i Processing i stedet for op som i "virkeligheden",
       //flyver fuglen altså opad. Man kunne ændre dette ved at sætte 0,5 i plus i stedet, men jeg har altså valgt at beholde den i -0,5.

   }
  }
}
