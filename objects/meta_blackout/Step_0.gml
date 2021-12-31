if alpha < 1 {

   alpha += 1/fade_time; // alpha will reach 1 at set fade time

   if alpha >= 1 {

       instance_destroy();

   }

}