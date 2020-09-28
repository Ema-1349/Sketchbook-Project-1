//Emma Dong
//Block 1-1B
//Sketchbook Project 1

//Hi Mr. Pelletier! I searched around on the internet how to be able to control a... shape or function, with your keyboard! (I still think of these as sprites from last year in computer science 10 haha)
//It took some time to understand how all the if statements worked and how to 
//keep the speed reasonable... I like how it turned out! But i didnt put in boundaries for the character. and i couldnt figure out how to make the transitions from one direction smoother. There was an 
//article that talked about a function called boolean? I didnt understand it so I didnt put it in my code. (Wouldnt want to put something i dont understand in my code in case i need to make edits in 
//the future!) Anywho, you can control the character with the WASD keys, just dont make it fly off the page or it'll dissapear! The little girl, which represents me as a cartoon character, took a long
//time to make. I found out how arcs work too! So setting that up, in all four directions, took a LONG time. All worth it in the end though, I hope. At first, with this sketchbook project, I didnt know
//what to do. Im a pretty indecisive person, so the first few days i was just fillding around with code, trying to understand the bird thing more. I sent you an email a few days ago asking where i got
//wrong in this code experiment on a bird. i thought i would need it as at that moment i was still thinking of making a scene in the outdoors. Then, i woke up with an idea in my head! Thank goodness too
//haha, it was just in the nick of time. Now all i needed to do was research and understand how the code worked to repurpose it for my own uses. I still dont think i did the keyPressed and keyUp things 
//correctly, but hey, it works and i understand like 50% of it! haha. Sorry for writing so much here! I hope you like the project. I just made me in the center of a cloud/dream bubble i guess, 
//surrounded by things i like. The background is pastel purple because that's one of my favorite colors. Also, the girl doesnt have arms... just... ignore that please... (In my defense the girl already
//took enough time! Oh and also, the blinking that you taught us is really useful in my opinion, for looping animations on complex illustrations :D) OH and the feet move by the way, :). Enough talking, 
//enjoy!
//(PS, when I went to inset the music, I didnt have "Minim" in my sketch library, but I installed it from "Add Library" :D)



import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music;


PImage schoolbuilding;
PImage chocolate;


float n = 325;                                              //Value of initial starting x-axis point for chocolate
float m = 325;                                              //Value of initial starting y-axis point for chocolate
float a = 3;                                                //x axis addition (aka speed)
float b = 2;                                                //y axis addition


float x = 340;                                              //Variables for the character
float y = 250;
float speed = 2;                                            //Character's initial speed
float speedcount = 0;                                       //Counter for increase of character's speed
float blinkcount = 0;                                       //Counter for A, D keys -- leg movement
float pencilcount = 0;                                      //Counter for pencil blinking
float familycount = 0;                                      //Counter for family function


void setup(){
  size(800,800);
  schoolbuilding = loadImage("schoolbuilding.png");
  chocolate = loadImage("choco.png");
  
  minim = new Minim(this);                                  //Music setup
  music = minim.loadFile("music.mp3");
  music.play();
}



void draw(){
  background(210,183,255);
   
  //    Cloud    //
  fill(255);
  stroke(255);
  ellipse(400,400,600,600);
  ellipse(100,200,400,300);
  ellipse(100,800,200,500);
  ellipse(600,200,500,500);
  ellipse(600,600,400,400);
  ellipse(200,600,500,500);
  ellipse(300,80,200,200);
  ellipse(150,300,300,300);

  book(); 
  
  image(schoolbuilding,530,550);
  
  //    Family    //
  familycount = familycount + 1;                               //Counter speed
  if (familycount < 40) {familyA();}                           //Restrictions
  if (familycount > 40) {familyB();}
  if (familycount > 80) {familycount = 0;}
  
//    Pencil    //
  if (pencilcount < 20) {pencilA();}                           //Pencil Movement restrictions
  if (pencilcount > 20) {pencilB();}
  if (pencilcount > 40) {pencilcount = 0;}
  pencilcount = pencilcount + 0.75;                            //Pencil counter speed
  
  
//    Chocolate Movement    //
  n = n + a;                                                   //Movement speed
  m = m + b;
  if (n > 500) {a = -2;}                                       //Restrictions
  if (n < 150) {a = 3;}
  if (m > 500) {b = -3;}
  if (m < 150) {b = 1;}
  fill(255,255,255,1);
  noStroke();
  rect(150,150,500,500);
  ellipse(n+75,m+75,200,200);                                  //Rectangle and Ellipse served a purpose of knowing where the chocolate's boundaries were.
  image(chocolate,n,m);

//    Kawaii Character    //
  if (keyPressed) {                                            //Character moving down
    if (key == 's') {
      Skawaii(); }
    }
   if (keyPressed) {                                           //Character moving up
     if (key == 'w') {
       Wkawaii(); }
    }
   if (keyPressed) {                                           //Character moving right
     if (key == 'd') {
       if (blinkcount < 20) {
        DAkawaii(); 
      }
       if (blinkcount > 20) {
        DBkawaii(); 
      }
     }
   }
   if (keyPressed) {                                          //Character moving left
     if (key == 'a') {
       if (blinkcount < 20) {
         AAkawaii();
       }
       if (blinkcount > 20) {
         ABkawaii();
       }
     }
   }
    else {                                                     //Resting position
      Skawaii();
    }
  speed = speed + speedcount;                                  //Movement speed
  speedcount = speedcount + 0.001;
  if (speed > 10) {speed = 10;}                                //Max Speed
  blinkcount = blinkcount + 1;                                 //Leg movement counter
  if (blinkcount > 40) {blinkcount = 0;}
}



//    Pencil A   //
void pencilA(){
  fill(240);                            //Paper
  stroke(240);
  quad(110,80,180,80,280,300,20,300);
  
  fill(255,210,113);                    //Wood Bit
  strokeWeight(3);
  stroke(255,190,49);
  quad(130,90,160,70,180,160,150,180);
  
  fill(230);                            //Metal Bit
  stroke(225);
  quad(125,93,165,67,160,47,120,73);
  
  fill(255,137,220);                    //Eraser
  stroke(255,124,216);
  quad(123,67,155,46,153,39,121,60);
  
  fill(222,198,168);                    //Pencil Tip
  stroke(222,198,158);
  triangle(180,160,150,180,170,200);
  fill(0);
  stroke(0);
  triangle(170,200,171,196,168,198);
  
  line(170,205,121,195);                //Written "text"
}



//    Pencil B    //
void pencilB(){
  fill(240);                            //Paper
  stroke(240);
  quad(110,80,180,80,280,300,20,300);
  
  fill(255,210,113);                    //Wood Bit
  strokeWeight(3);
  stroke(255,190,49);
  quad(130,50,160,70,140,170,110,150);
  
  fill(230);                            //Metal Bit
  stroke(225);
  quad(125,45,170,65,165,82,120,62);
  
  fill(255,137,220);                    //Eraser
  stroke(255,124,216);
  quad(128,43,162,58,165,48,131,35);
  
  fill(222,198,168);                    //Pencil Tip
  stroke(222,198,158);
  triangle(140,170,110,150,121,190);
  fill(0);
  stroke(0);
  triangle(121,190,120,186,123,188);
  
  line(170,205,121,195);                 //Written "text"
} 



//    Families    //
void familyB(){
  //    Mum    //
  fill(0);
  stroke(0);
  strokeWeight(5);
  triangle(50,750,100,750,75,650);    //Body
  
  line(65,750,65,785);                //Legs
  line(85,750,85,785);
  line(65,785,55,765);
  line(85,785,95,765);
  
  line(67.5,680,40,650);              //Arms
  line(82.5,680,110,650);
  
  ellipse(75,650,50,50);              //Head

//    Brother    //
  rect(137,670,50,100,30,30,100,100); //Body
  
  line(152,750,152,790);              //Legs
  line(172,750,172,790);
  line(152,790,142,770);
  line(172,790,182,770);
  
  line(140,680,110,650);              //Arms
  line(184.5,680,210,660);
  
  ellipse(162,645,50,50);             //Head

//    Child    //
  ellipse(249,680,40,40);             //Head
  
  triangle(249,690,269,760,229,760);  //Body
  
  line(259,750,259,780);              //Legs
  line(239,750,239,780);
  line(239,780,229,792);
  line(259,780,269,792);
  
  line(210,660,250,705);              //Arms
  line(285,660,250,705);
}



void familyA(){
//    Mum    //
  fill(0);
  stroke(0);
  strokeWeight(5);
  triangle(50,750,100,750,75,650);    //Body
  line(65,750,65,800);                //Legs
  line(85,750,85,800);
  line(67.5,680,40,720);              //Arms
  line(82.5,680,110,720);  
  ellipse(75,650,50,50);              //Head

//    Dad    //
  rect(137,670,50,100,30,30,100,100); //Body
  line(152,750,152,800);              //Legs
  line(172,750,172,800);
  line(140,680,110,720);              //Arms
  line(184.5,680,210,720);
  ellipse(162,645,50,50);             //Head

//    Child    //
  ellipse(249,680,40,40);             //Head
  triangle(249,690,269,760,229,760);  //Body
  line(259,750,259,800);              //Legs
  line(239,750,239,800);
  line(210,720,250,705);              //Arms
  line(285,720,250,705);
}



//       Book        //
void book(){
  strokeWeight(3);
  
  noFill();
  stroke(242, 232, 201);
  
  arc(470,222,150,150,radians(-90),radians(-15));         //Three curves for the bottom of the book
  arc(543,214,20,20,radians(-90),radians(-15));
  arc(553,300,175,175,radians(-90),radians(-15));

  arc(553,275,180,180,radians(-85),radians(-20));         //Two curves for the bottom-most pages
  arc(474,214,180,180,radians(-90),radians(-20));
  
  line(470,147,470,125);                                  //Line for bottom-left corner part of book
  
  quad(720,195,720,160,637,245,637,278);                  //Quadrilateral for bottom-right part of book
  
  line(470,125,560,40);                                   //Lines for left-most page side, and middle line, respectively
  line(560,185,642,98);
  
  arc(555,130,180,180,radians(-85),radians(-18));         //Curves for the two top curves of book
  arc(634,188,180,180,radians(-85),radians(-20));
 
}



//       Downwards/Normal Kawaii Character       //
void Skawaii(){  
  fill(108,67,67);                                             //Hair
  stroke(108,69,69);
  rect(x-20,y-20,200,300,1000,1000,30,30);   
  stroke(94, 58, 58);
  fill(94, 58, 58);
  rect(x,y,160,278,1000,1000,0,0);
  
  fill(149,24,24);                                             //Shoes
  stroke(139,21,21);
  rect(x+40,y+285,25,20,100,100,2,2);
  rect(x+90,y+285,25,20,100,100,2,2);
  
  fill(198,46,46);                                             //Dress
  strokeWeight(2);
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(135));  
  fill(89,41,41);                                              //Dress Highlight
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(50));
  
  fill(255, 230, 227);                                         //Head
  stroke(255, 221, 212);
  rect(x,y,160,160,100,100,1000,1000);       
  
  fill(108,67,67);                                             //Bangs
  stroke(108,69,69);
  rect(x,y-5,160,75,100,100,5,5);   
  fill(255, 230, 227);                                         //Triangle to show some forehead
  stroke(255, 230, 227);
  triangle(x+80,y+10,x+70,y+80,x+90,y+80); 
  stroke(94, 58, 58);                                          //Bangs highlight
  fill(94, 58, 58);
  triangle(x+79,y+5,x+70,y+70,x+75,y+70);

  noFill();                                                    //Mouth
  stroke(220,55,83);
  arc(x+80,y+40,80,200,radians(82),radians(98));
  
  noFill();                                                    //Nose
  stroke(255,200,191);
  arc(x+80,y+120,10,10,radians(45),radians(135));
  
  fill(255);                                                   //Eyes (corneas)
  stroke(255);
  rect(x+28,y+80,30,25,20,20,1,1);
  rect(x+102,y+80,30,25,20,20,1,1);
  fill(0);                                                     //Pupils
  stroke(0);
  rect(x+38,y+93,18,12,20,20,1,1);
  rect(x+104,y+93,18,12,20,20,1,1);
  
  fill(244,199,212,80);                                        //Blush
  noStroke();
  ellipse(x+39,y+118,40,10);
  ellipse(x+122,y+118,40,10);
}



//        Upwards Kawaii Character        //
void Wkawaii(){
  fill(149,24,24);                                             //Shoes
  stroke(139,21,21);
  rect(x+40,y+285,25,20,100,100,2,2);
  rect(x+90,y+285,25,20,100,100,2,2);
  
  fill(198,46,46);                                             //Dress
  strokeWeight(2);
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(135));  
  
  fill(108,67,67);
  stroke(108,69,69);
  rect(x-20,y-20,200,300,1000,1000,30,30);                     //Hair
}



//         Right Kawaii Character A        //
void DAkawaii(){
  fill(149,24,24);                                             //Shoes
  stroke(139,21,21);
  rect(x+60,y+285,25,20,100,100,2,2);
  
  fill(198,46,46);                                             //Dress
  strokeWeight(2);
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(135));  
  
  fill(255, 230, 227);                                         //Head
  stroke(255, 221, 212);
  rect(x,y,160,160,100,100,1000,1000);   
  
  fill(108,67,67);                                             //Hair
  stroke(108,69,69);
  rect(x-20,y-20,120,300,1000,1000,30,30);                     
  rect(x+10,y-22,160,100,1000,1000,2,30);
  
  fill(255);                                                   //Eyes (corneas)
  stroke(255);
  rect(x+120,y+80,30,25,20,20,1,1);
  fill(0);                                                     //Pupils
  stroke(0);
  rect(x+130,y+93,18,12,20,20,1,1);
  
  fill(244,199,212,80);                                        //Blush
  noStroke();
  ellipse(x+122,y+118,40,10);
  
  noFill();                                                    //Mouth
  stroke(220,55,83);
  line(x+132,y+135,x+142,y+138);
}



//          Right Kawaii Character B         //
void DBkawaii(){
  fill(149,24,24);                                             //Shoes
  stroke(139,21,21);
  rect(x+40,y+285,25,20,100,100,2,2);
  rect(x+90,y+285,25,20,100,100,2,2);
  
  fill(198,46,46);                                             //Dress
  strokeWeight(2);
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(135));  
  
  fill(255, 230, 227);                                         //Head
  stroke(255, 221, 212);
  rect(x,y,160,160,100,100,1000,1000);   
  
  fill(108,67,67);                                             //Hair
  stroke(108,69,69);
  rect(x-20,y-20,120,300,1000,1000,30,30);                     
  rect(x+10,y-22,160,100,1000,1000,2,30);
  
  fill(255);                                                   //Eyes (corneas)
  stroke(255);
  rect(x+120,y+80,30,25,20,20,1,1);
  fill(0);                                                     //Pupils
  stroke(0);
  rect(x+130,y+93,18,12,20,20,1,1);
  
  fill(244,199,212,80);                                        //Blush
  noStroke();
  ellipse(x+122,y+118,40,10);
  
  noFill();                                                    //Mouth
  stroke(220,55,83);
  line(x+132,y+135,x+142,y+138);
}



//      Left Kawaii Character A     //
void AAkawaii(){
  fill(149,24,24);                                             //Shoes
  stroke(139,21,21);
  rect(x+60,y+285,25,20,100,100,2,2);
  
  fill(198,46,46);                                             //Dress
  strokeWeight(2);
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(135));  
  
  fill(255, 230, 227);                                         //Head
  stroke(255, 221, 212);
  rect(x,y,160,160,100,100,1000,1000);   
  
  fill(108,67,67);                                             //Hair
  stroke(108,69,69);
  rect(x+60,y-20,120,300,1000,1000,30,30);                     
  rect(x-9,y-22,160,100,1000,1000,30,2);
  
  fill(255);                                                   //Eyes (corneas)
  stroke(255);
  rect(x+20,y+80,30,25,20,20,1,1);
  fill(0);                                                     //Pupils
  stroke(0);
  rect(x+23,y+93,18,12,20,20,1,1);
  
  fill(244,199,212,80);                                        //Blush
  noStroke();
  ellipse(x+38,y+118,40,10);
  
  noFill();                                                    //Mouth
  stroke(220,55,83);
  line(x+28,y+135,x+18,y+138);
}



//      Left Kawaii Character B      //
void ABkawaii(){
  fill(149,24,24);                                             //Shoes
  stroke(139,21,21);
  rect(x+40,y+285,25,20,100,100,2,2);
  rect(x+90,y+285,25,20,100,100,2,2);
  
  fill(198,46,46);                                             //Dress
  strokeWeight(2);
  stroke(0);
  arc(x+80,y+140,240,320,radians(45),radians(135));  
  
  fill(255, 230, 227);                                         //Head
  stroke(255, 221, 212);
  rect(x,y,160,160,100,100,1000,1000);   
  
  fill(108,67,67);                                             //Hair
  stroke(108,69,69);
  rect(x+60,y-20,120,300,1000,1000,30,30);                     
  rect(x-9,y-22,160,100,1000,1000,30,2);
  
  fill(255);                                                   //Eyes (corneas)
  stroke(255);
  rect(x+20,y+80,30,25,20,20,1,1);
  fill(0);                                                     //Pupils
  stroke(0);
  rect(x+23,y+93,18,12,20,20,1,1);
  
  fill(244,199,212,80);                                        //Blush
  noStroke();
  ellipse(x+38,y+118,40,10);
  
  noFill();                                                    //Mouth
  stroke(220,55,83);
  line(x+28,y+135,x+18,y+138);
}



//        Movement        //
void keyPressed(){                                            //Movement of Character with WASD keys
  if (key == 'w') {y = y - speed;}
  if (key == 's') {y = y + speed;}
  if (key == 'a') {x = x - speed;}
  if (key == 'd') {x = x + speed;}
}



void keyReleased(){                                           //slows/resets speed when changing directions/when hitting different direction's keys
  if (key == 's') {speed = 2;}
  if (key == 's') {speedcount = 0;}
  
  if (key == 'w') {speed = 2;}
  if (key == 'w') {speedcount = 0;}
  
  if (key == 'a') {speed = 2;}
  if (key == 'a') {speedcount = 0;}
  
  if (key == 'd') {speed = 2;}
  if (key == 'd') {speedcount = 0;}
}
