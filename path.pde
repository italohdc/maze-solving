//Analysis if the given position is allowed or not allowed to go//
int find_path (int px, int py)//(int px, int py)
{
  if(px<0 || py<0 || px>=MAZE_X || py>=MAZE_Y) return -1; //Outside the Maze
  
  switch(maze[py][px])
  {
    case '#': //Wall
      return 0;
    
    case '.': //Open
    case 'S': //Start
    case 'E': //Goal
    case 'R': //Robot
      return 1;
    
    default:
      return 0;
  }
}
