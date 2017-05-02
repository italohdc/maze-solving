//===================
//  PRINT FUNCTIONS
//===================

void print_maze_values ()
{
  print_maze();
  calculate_return_start();
  calculate_return_end();
  print_available_place();
  print_dist_start();
  print_dist_end();
}

void print_maze ()
{
  println("MAZE");
  for(int i=0; i<MAZE_Y; i++) {
    print("A"+i);
    print("\t");
    for(int j=0; j<MAZE_X; j++) {
      if(current_pos_X==j && current_pos_Y==i) print('R');
      else print(maze[i][j]);
      print("  ");
    }
    println();
  }
  println();
}

void print_last_dir ()
{
  println("LAST DIRECTION");
  for(int i=0; i<MAZE_Y; i++) {
    print("F"+i);
    print("\t");
    for(int j=0; j<MAZE_X; j++) {
      print(last_dir[i][j]);
      print("  ");
    }
    println();
  }
  println();
}

void print_dist_start ()
{
  println("DISTANCE TO START");
  for(int i=0; i<MAZE_Y; i++) {
    print("C"+i);
    print("\t");
    for(int j=0; j<MAZE_X; j++) {
      print(dist_to_start[i][j]);
      print("  ");
    }
    println();
  }
  println();
}

void print_way_traveled ()
{
  println("DISTANCE TO START");
  for(int i=0; i<MAZE_Y; i++) {
    print("E"+i);
    print("\t");
    for(int j=0; j<MAZE_X; j++) {
      print(way_traveled[i][j]);
      print("  ");
    }
    println();
  }
  println();
}

void print_dist_end ()
{
  println("DISTANCE TO END");
  for(int i=0; i<MAZE_Y; i++) {
    print("D"+i);
    print("\t");
    for(int j=0; j<MAZE_X; j++) {
      print(dist_to_end[i][j]);
      print("  ");
    }
    println();
  }
  println();
}

void print_available_place ()
{
  println("AVAILABLE PLACES");
  for(int i=0; i<MAZE_Y; i++) {
    print("B"+i);
    print("\t");
    for(int j=0; j<MAZE_X; j++) {
      print(find_path(i,j));
      print("  ");
    }
    println();
  }
  println();
}
