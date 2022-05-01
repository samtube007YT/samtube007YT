// all credits to samtube007 (me) on YouTube


///////////////////////////////////////////////////////////////////////////////////|
//!!! WARNING this is a horror game with flashing lights and jumpscares !!! WARNING|
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|

//please read above

//please do not worry if the game trys to steal you info
//if there is a reference to private info do not worry because it is randomized and is not actually your info (:

// now go ahead and enjoy the game (:







float posX = width/2;
float posY = height/2;
float velX = 0;
float velY = 0;
float gravity = .03;
int section = 1;
int timer = 0;
int catchWarning = 0;
int angerStage;
int circle_miss;
int circle_pos = 1;
boolean held;

void setup(){
  size(displayWidth,displayHeight);
  background(90,90,90);
  posX = width/2;
  posY = height/2;
  frameRate(10000);
  noCursor();
}

void draw(){
  if(!(section == 666 || section == 665)){
     background(90,90,90);
   }
  fill(240,15,0);
  circle(posX,posY,40);
  line(posX,posY-20,posX,posY-28);
  fill(230,230,230);
  circle(mouseX,mouseY,10);
  if(mousePressed && dist(posX,posY,mouseX,mouseY)<25 && section != 2 && angerStage != 1){
    velY = 0;
    if(!(pmouseX == mouseX)){
      posX += ((posX-pmouseX)/2)*-1;
   }
    if(!(pmouseY == mouseY)){
      posY += ((posY-pmouseY)/2)*-1;
   }
   held = true;
  }
  else if(!(posY>height-40)){
    velY += gravity;
    posY += velY;
    posX += velX;
    if(held){
      held = false;
      velX = (mouseX - pmouseX)/1.5;
      velY = (mouseY - pmouseY)/1.5;
   }
   if(posX>width || posX<0){
     velX *= -1;
   }
  }
  else{
    velY = 0;
  }
  //level one
  if(section == 1){
    line(width/4.5,height,width/4.5,height-height/3);
    fill(0,0,0);
    textSize(25);
    text("drag the apple into the box!",width/2,height/4);
  }
  if(section == 1 && posX<width/4.5 && posY>height-height/12){
    section = 2;
  }
  else if(section == 2 && posX<width/4.5 && posY>height-height/12){
    timer += 1;
  }
  if(timer>450 && section == 2){
    section = 3;
    timer = 0;
  }
  //level two
  if(section == 3 && timer<700){
    posX = width/2;
    posY = height/2;
    timer += 1;
    fill(0,0,0);
    textSize(25);
    text("congrats! Lets go to level 2! dont let the apple hit the floor!",width/2,height/4);
    velY = 0;
    velX = 0;
  }
  else if(section == 3 && posY>height-40){
    if(catchWarning == 0 || catchWarning == 1){
      timer = 0;
      catchWarning += 1;
    }
    else{
      angerStage = 1;
      section = 666;
      timer = 0;
    }
  }
  // (: 666 (:
  if(section == 666 && timer<1750){
    textSize(10);
    fill(255,0,0);
    text("close",random(0,width),random(0,height));
    text("the",random(0,width),random(0,height));
    text("progarm",random(0,width),random(0,height));
    timer += 1;
  }
  //close progarm error screen
  else if(timer >= 1750 && section == 666 && timer<1990){
    textSize(width/15);
    fill(0,0,0);
    text("CLOSE THE PROGARM",0,height/2);
    timer += 1;
    velX = 0;
  }
  if(timer == 1990 && section == 666){
    section = 4;
    timer = 0;
    angerStage = 0;
    posX = width/2;
    posY = height/2;
  }
  //level three
  if(section == 4 && timer<700){
    timer = 0;
    fill(0,0,0);
    textSize(25);
    if(circle_miss<4){
    text("level t̶h̶e̶r̶e two, drag the apple to the circle! (sides of the screen)",width/2,height/4);
    }
    else if(circle_miss<8){
      text("level t̶h̶e̶r̶e̶ two, drag the apple to the circle...",width/2,height/4);
    }
    else{
      section = 667;
      timer = 0;
    }
  }
  if(section == 4){
    if(circle_pos == 1){
      fill(70,70,70);
      circle(0,height/2,20);
      if(dist(posX,posY,0,height/2)<235){
        circle_pos = 2;
        circle_miss += 1;
      }
    }
    else{
      fill(70,70,70);
      circle(width,height/2,20);
      if(dist(posX,posY,width,height/2)<235){
        circle_pos = 1;
        circle_miss += 1;
      }
    }
   }
   if(section == 667 && timer<765){
     textSize(45);
     text(random(5,255)+"."+random(5,255)+"."+random(5,255)+"."+random(5,255),0,height/2);
     timer += 1;
   }
   if(timer == 765 && section == 667){
     section = 665;
     timer = 0;
   }
   if(section == 665){
     timer += 1;
     if(timer>270){
       textSize(28);
       text("is this your IP address?",width/4,height/8);
     }
     if(timer>290){
       textSize(17);
       text("yes",width/6,height*5/6);
       text("̶n̶o yes",width*5/6,height*5/6);
     }
     if(timer>385){
       section = 6;
       timer = 0;
     }
   }
   if(section == 6 && timer<623){
     textSize(25);
     text("sorry about the ERROR, just remember this is beta testing",width/2-40,height/4);
     timer += 1;
   }
   if(section == 6 && timer == 623){
     fill(255,0,0);
     textSize(((width/2)+(height/2))/1.5);
     text("(:",width/1.5,height/1.5);
     timer += 1;
   }
   else if(section == 6 && timer == 624){
     textSize(25);
     fill(0,0,0);
     text("if you made it this far then thank you so much (:. But this is the end of the game but you can play with the apple for a bit. A game by Samtube007",0,height/2);
   }
  }
