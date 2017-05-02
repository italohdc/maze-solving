//=================
//  SPECIAL CASES
//=================

//DELETE ENDLESS ROUTES//
//Delete the square in case it's an endless route
void delete_path (int dx, int dy)
{
  int av_place = find_path(dx+1, dy) + find_path(dx-1, dy) +
    find_path(dx, dy-1) + find_path(dx, dy+1);
  
  if(av_place == 1 && maze[dy][dx] != '#' && maze[dy][dx] != 'E'
      && maze[dy][dx] != ' ' && maze[dy][dx] != 'S'){
    maze[dy][dx] = ' ';
    empty = true;
  }
}

//SAVE LAST DIRECTION//
//Save the last direction gone by the robot on a square
void save_last_dir (char dir, int sx, int sy)
{
  switch(dir)
  {
    case 'U':
      last_dir[sy][sx] = 'U';
    break;
    
    case 'D':
      last_dir[sy][sx] = 'D';
    break;
    
    case 'L':
      last_dir[sy][sx] = 'L';
    break;
    
    case 'R':
      last_dir[sy][sx] = 'R';
    break;
  }
}
