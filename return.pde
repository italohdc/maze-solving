void calculate_return_end () //Calculate distances (X+Y) to the end
{
  for (int i=0; i<MAZE_Y; i++) {
    for (int j=0; j<MAZE_X; j++) {
      dist_to_end[i][j] = abs(i-end_pos_X) + abs(j-end_pos_Y);
      
      //if(find_path(i,j) == 0){
      //  dist_to_end[i][j] ++;
      //}
    }
  }
}

void calculate_return_start () //Calculate distances (X+Y) to the start
{
  for (int i=0; i<MAZE_Y; i++) {
    for (int j=0; j<MAZE_X; j++) {
      dist_to_start[i][j] = abs(i-start_pos_X) + abs(j-start_pos_Y);
      
      //if(find_path(i,j) == 0){
      //  dist_to_end[i][j] ++;
      //}
    }
  }
}

void calculate_empty_places () //Make a full map of the empty places
{
  for (int i=0; i<MAZE_Y; i++) {
    for (int j=0; j<MAZE_X; j++) {
      delete_path(j,i);
    }
  }
}

//Returns the distance to the end from UP, DOWN,//
//LEFT and RIGHT points of a given position     //
int available_place (char letter)
{
  switch (letter)
  {
    case 'U':
    //if(find_path(current_pos_X,current_pos_Y-1) == 0) return -1;
    return dist_to_end[current_pos_Y-1][current_pos_X];
    
    case 'D':
    //if(find_path(current_pos_X,current_pos_Y+1) == 0) return -1;
    return dist_to_end[current_pos_Y+1][current_pos_X];
    
    case 'L':
    //if(find_path(current_pos_X-1,current_pos_Y) == 0) return -1;
    return dist_to_end[current_pos_Y][current_pos_X-1];
    
    case 'R':
    //if(find_path(current_pos_X+1,current_pos_Y) == 0) return -1;
    return dist_to_end[current_pos_Y][current_pos_X+1];
    
    default:
    return -1;
  }
}

//Returns how many times the robot have been in UP, DOWN,//
//LEFT and RIGHT points of a given position              //
int way_place (char letter)
{
  switch(letter)
  {
    case 'U':
    if(find_path(current_pos_X,current_pos_Y-1) == 0) return -1;
    else return way_traveled[current_pos_Y-1][current_pos_X];
    
    case 'D':
    if(find_path(current_pos_X,current_pos_Y+1) == 0) return -1;
    else return way_traveled[current_pos_Y+1][current_pos_X];
    
    case 'L':
    if(find_path(current_pos_X-1,current_pos_Y) == 0) return -1;
    else return way_traveled[current_pos_Y][current_pos_X-1];
    
    case 'R':
    if(find_path(current_pos_X+1,current_pos_Y) == 0) return -1;
    else return way_traveled[current_pos_Y][current_pos_X+1];
    
    default:
    return -1;
  }
}
