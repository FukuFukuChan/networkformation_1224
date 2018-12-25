void setup() {
  Network network = new Network(6, 1.4) ;
  // 完全グラフ
  // int[][] a = {{0,1,1,1,1,1},{1,0,1,1,1,1},{1,1,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,1},{1,1,1,1,1,0}} ; //(1)
  // 辺が14本
  // int[][] a = {{0,1,1,1,1,0},{1,0,1,1,1,1},{1,1,0,1,1,1},{1,1,1,0,1,1},{1,1,0,1,1,1},{0,1,1,1,1,0}} ; //(1)
  // 辺が13本
  // int[][] a = {{0,1,1,1,1,0},{1,0,0,1,1,1},{1,0,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(1)
  // int[][] a = {{0,1,1,1,0,0},{1,0,1,1,1,1},{1,1,0,1,1,1},{1,1,1,0,1,1},{0,1,1,1,0,1},{0,1,1,1,1,0}} ; //(2)
  // 辺が12本
  int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(1)
  // int[][] a = {{0,1,1,0,1,0},{1,0,0,1,1,1},{1,0,0,1,1,1},{0,1,1,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(2)
  // int[][] a = {{0,1,1,1,1,0},{1,0,0,1,1,1},{1,0,0,1,1,1},{1,1,1,0,0,1},{1,1,1,0,0,1},{0,1,1,1,1,0}} ; //(3)
  // 辺の数が11本
  // int[][] a = {{0,0,0,1,1,0},{0,0,0,1,1,1},{0,0,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(1)
  // int[][] a = {{0,0,1,0,1,0},{0,0,0,1,1,1},{1,0,0,1,1,1},{0,1,1,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(2)
  // int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,0,1,1},{1,1,1,0,1,1},{1,1,1,1,0,1},{0,1,0,1,1,0}} ; //(3)
  // int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,0},{0,0,1,1,1,0}} ; //(4)
  // int[][] a = {{0,1,1,0,0,0},{1,0,0,1,1,1},{1,0,0,1,1,1},{0,1,1,0,1,1},{0,1,1,1,0,1},{0,1,1,1,1,0}} ; //(5)
  // int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,1,1,1},{1,1,1,0,0,1},{1,1,1,0,0,1},{0,1,1,1,1,0}} ; //(6)
  // 辺の数が10本
  // int[][] a = {{0,0,0,0,1,0},{0,0,0,1,1,1},{0,0,0,1,1,1},{0,1,1,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(1)
  // int[][] a = {{0,0,0,1,1,0},{0,0,0,1,1,0},{0,0,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,1},{0,0,1,1,1,0}} ; //(2)
  // int[][] a = {{0,0,0,1,1,0},{0,0,0,1,1,1},{0,0,0,0,1,1},{1,1,0,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(3)
  // int[][] a = {{0,0,0,1,1,0},{0,0,0,1,1,1},{0,0,0,1,1,1},{1,1,1,0,1,1},{1,1,1,1,0,0},{0,1,1,1,0,0}} ; //(4)
  // int[][] a = {{0,0,0,1,1,0},{0,0,0,1,1,1},{0,0,0,1,1,1},{1,1,1,0,0,1},{1,1,1,0,0,1},{0,1,1,1,1,0}} ; //(5)
  // int[][] a = {{0,0,1,0,0,0},{0,0,0,1,1,1},{1,0,0,1,1,1},{0,1,1,0,1,1},{0,1,1,1,0,1},{0,1,1,1,1,0}} ; //(6)
  // int[][] a = {{0,0,1,0,1,0},{0,0,0,1,0,1},{1,0,0,1,1,1},{0,1,1,0,1,1},{1,0,1,1,0,1},{0,1,1,1,1,0}} ; //(7)
  // int[][] a = {{0,0,1,0,1,0},{0,0,0,1,1,1},{1,0,0,0,1,1},{0,1,0,0,1,1},{1,1,1,1,0,1},{0,1,1,1,1,0}} ; //(8)
  // int[][] a = {{0,0,1,0,1,0},{0,0,0,1,1,1},{1,0,0,1,1,1},{0,1,1,0,0,1},{1,1,1,0,0,1},{0,1,1,1,1,0}} ; //(9)
  // int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,1,1,0},{1,1,1,0,0,1},{1,1,1,0,0,1},{0,1,0,1,1,0}} ; //(10)
  // int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,1,0,1},{1,1,1,0,1,1},{1,1,0,1,0,0},{0,1,1,1,0,0}} ; //(11)
  // int[][] a = {{0,0,1,1,1,0},{0,0,0,1,1,1},{1,0,0,0,1,1},{1,1,0,0,0,1},{1,1,1,0,0,1},{0,1,1,1,1,0}} ; //(12)
  // 辺９本
  // int[][] a = {{0,1,0,1,0,1},{1,0,1,0,1,0},{0,1,0,1,0,1},{1,0,1,0,1,0},{0,1,0,1,0,1},{1,0,1,0,1,0}} ; //3,3,3,3,3,3(1)
  // int[][] a = {{0,1,0,1,0,1},{1,0,1,0,0,1},{0,1,0,1,1,0},{1,0,1,0,1,0},{0,0,1,1,0,1},{1,1,0,0,1,0}} ; //3,3,3,3,3,3(2)
  // 辺８本
  // int[][] a = {{0,1,0,1,0,0},{1,0,1,0,1,0},{0,1,0,1,0,1},{1,0,1,0,1,0},{0,1,0,1,0,1},{0,0,1,0,1,0}} ; //2,3,3,3,3,2(1)(1)
  // int[][] a = {{0,1,0,0,0,1},{1,0,1,0,1,0},{0,1,0,1,0,1},{0,0,1,0,1,0},{0,1,0,1,0,1},{1,0,1,0,1,0}} ; //2,3,3,2,3,3(1)(2)
  // int[][] a = {{0,0,0,1,0,1},{0,0,1,0,0,1},{0,1,0,1,1,0},{1,0,1,0,1,0},{0,0,1,1,0,1},{1,1,0,0,1,0}} ; //2,2,3,3,3,3(2)(3)
  // int[][] a = {{0,1,0,1,0,1},{1,0,1,0,0,1},{0,1,0,1,0,0},{1,0,1,0,1,0},{0,0,0,1,0,1},{1,1,0,0,1,0}} ; //3,3,3,3,3,3(2)(4)
  // int[][] a = {{0,1,0,0,0,1},{1,0,1,0,0,1},{0,1,0,1,1,0},{0,0,1,0,1,0},{0,0,1,1,0,1},{1,1,0,0,1,0}} ; //2,3,3,2,3,3(2)(5)
  // 辺７本
  int[][] a = {{0,1,0,0,0,1},{1,0,1,0,0,0},{0,1,0,1,0,1},{0,0,1,0,1,0},{0,0,0,1,0,1},{1,0,1,0,1,0}} ; //2,2,3,2,2,3(1)
  // int[][] a = {{0,0,0,1,0,0},{0,0,1,0,1,0},{0,1,0,1,0,1},{1,0,1,0,1,0},{0,1,0,1,0,1},{0,0,1,0,1,0}} ; //1,2,3,3,3,2(2)
  // int[][] a = {{0,1,0,0,0,1},{1,0,0,0,0,1},{0,0,0,1,1,0},{0,0,1,0,1,0},{0,0,1,1,0,1},{1,1,0,0,1,0}} ; //2,2,2,2,3,3(3)
  // int[][] a = {{0,1,0,0,0,1},{1,0,1,0,0,1},{0,1,0,1,0,0},{0,0,1,0,1,0},{0,0,0,1,0,1},{1,1,0,0,1,0}} ; //2,3,2,2,2,3(4)
  // int[][] a = {{0,1,0,1,0,1},{1,0,1,0,0,1},{0,1,0,0,0,0},{1,0,0,0,1,0},{0,0,0,1,0,1},{1,1,0,0,1,0}} ; //3,3,1,2,2,3(5)
  // int[][] a = {{0,0,0,0,0,1},{0,0,1,0,0,1},{0,1,0,1,1,0},{0,0,1,0,1,0},{0,0,1,1,0,1},{1,1,0,0,1,0}} ; //1,2,3,2,3,3(6)
  // 辺６本
  // int[][] a = {{0,1,0,0,0,0},{1,0,1,0,0,0},{0,1,0,1,0,1},{0,0,1,0,1,0},{0,0,0,1,0,1},{0,0,1,0,1,0}} ; //1,2,3,2,2,2(1)
  // int[][] a = {{0,0,0,0,0,1},{0,0,1,0,0,0},{0,1,0,1,0,1},{0,0,1,0,1,0},{0,0,0,1,0,1},{1,0,1,0,1,0}} ; //1,3,2,2,3,1(2)
  // int[][] a = {{0,1,0,0,0,0},{1,0,0,0,0,1},{0,0,0,1,1,0},{0,0,1,0,1,0},{0,0,1,1,0,1},{0,1,0,0,1,0}} ; //2,2,2,2,3,3(3)
  // int[][] a = {{0,0,0,0,0,1},{0,0,0,0,0,1},{0,0,0,1,1,0},{0,0,1,0,1,0},{0,0,1,1,0,1},{1,1,0,0,1,0}} ; //2,2,2,2,3,3(4)
  // int[][] a = {{0,1,0,0,0,1},{1,0,1,0,0,1},{0,1,0,0,0,0},{0,0,0,0,1,0},{0,0,0,1,0,1},{1,1,0,0,1,0}} ; //2,3,2,2,2,3(5)
  // int[][] a = {{0,1,0,1,0,1},{1,0,1,0,0,1},{0,1,0,0,0,0},{1,0,0,0,0,0},{0,0,0,0,0,1},{1,1,0,0,1,0}} ; //3,3,1,1,1,3(6)
  network.friendSet = a ;
  IntList trueIndexList = trueIndexList(network.friendSet) ;
  network.relationSet = new int[network.allPlayer.size()][network.allPlayer.size()] ;
  println("<Stable Network>") ;
  int[][][] powerArraySet = powerArraySet(trueIndexList, network.relationSet.length) ;
  int stableCount = 0 ;
  int equalCount = 0 ;
  int treeCount = 0 ;
  int treePlusOneLink = 0 ;
  int treePlusTwoLink = 0 ;
  int treePlusThreeLink = 0 ;
  float socialCost = 1000000 ;
  for(int i = 0 ; i < powerArraySet.length ; i++) {
    network.relationSet = powerArraySet[i] ;
    for(Player p : network.allPlayer) p.buildSet.clear() ;
    network.setBuildSet(network.relationSet) ;
    for(Player p : network.allPlayer) p.degree = 0 ;
    network.setDegree() ;
    if(network.isStable()) {
      println("-------------------------------------------") ;
      stableCount++ ;
      if (network.isEqualNetwork()) equalCount++ ;
      if (network.isTree()) treeCount++ ;
      if (network.isTreePlusOneLink()) treePlusOneLink++ ;
      if (network.isTreePlusTwoLink()) treePlusTwoLink++ ;
      if (network.isTreePlusThreeLink()) treePlusThreeLink++ ;
      arrayPrint(powerArraySet[i]) ;
      // println("isStable : " + network.isStable()) ;
      // println("F = F' : " + isEqualNetwork(network.friendSet, network.relationSet)) ;
      println("Diameter : " + network.getDiameter()) ;
      // println("isTree : " + network.isTree()) ;
      // println("isTreePlusOneLink : " + network.isTreePlusOneLink()) ;
      // println("isTreePlusTwoLink : " + network.isTreePlusTwoLink()) ;
      println("<Degree>") ;
      for(Player p : network.allPlayer) print("[" + p.index + "]" + p.degree + ",") ;
      println() ;
      println("<Cost>") ;
      for(Player p : network.allPlayer) {
        print("[" + p.index + "]Cost : " + p.calCost()
        + " = " + p.buildSet.size() + " * " +  network.alpha) ;
        for(int d : p.getDistanceCost()) print(" + " + d) ;
        println() ;
      }
    }
  }
  println(powerArraySet.length) ;
  // println("F = optimalSocialCostNetwork : " + isEqualNetwork(network.friendSet, optimalSocialCostNetwork)) ;
  println("------------------------------------------") ;
  println("<Instance F>") ;
  for(int n : trueIndexList) print(n + ",") ;
  println() ;
  arrayPrint(network.friendSet) ;
  network.relationSet = network.friendSet ;
  println("diameter : " + network.getDiameter()) ;
  println("stableCount : " + stableCount) ;
  println("equalCount : " + equalCount) ;
  println("treeCount : " + treeCount) ;
  println("treePlusOneLink : " + treePlusOneLink) ;
  println("treePlusTwoLink : " + treePlusTwoLink) ;
  println("treePlusThreeLink : " + treePlusThreeLink) ;
  exit() ;
}


IntList trueIndexList(int[][]a) {
  IntList trueIndexList = new IntList() ;
  for(int i = 0 ; i < a.length ; i++) {
    for(int j = 0 ; j < a[i].length ; j++) {
      if(a[i][j] != 0) trueIndexList.append(i * 10 + j) ;
    }
  }
  return trueIndexList ;
}

int[][] calcPowerSet(IntList trueIndexList, int n) {
  int[][] powerSet = new int[1 << n][] ;
  if (n == 0) powerSet[0] = new int[0] ;
  else {
    int[][] mini = calcPowerSet(trueIndexList, n - 1) ;
    for(int i = 0 ; i < mini.length ; i++) powerSet[i] = mini[i];
    for(int i = 0 ; i < mini.length ; i++) mini[i] = append(mini[i], trueIndexList.get(n - 1));
    for(int i = 0 ; i < mini.length ; i++) powerSet[i + mini.length] = mini[i];
  }
  return powerSet ;
}

int[][][] powerArraySet(IntList trueIndexList, int n) {
  int[][] powerSet = calcPowerSet(trueIndexList, trueIndexList.size()) ;
  int[][][] powerArraySet = new int[powerSet.length][n][n] ;
  for(int i = 0 ; i < powerArraySet.length ; i++) {
    for(int j = 0 ; j < powerSet[i].length ; j++) {
      powerArraySet[i][powerSet[i][j] / 10][powerSet[i][j] % 10] = 1 ;
    }
  }
  return powerArraySet ;
}

boolean isEqualEdgeSize(int[][]base, int[][]a) {
  int x = 0 ;
  int y = 0 ;
  for(int i = 0 ; i < base.length ; i++) {
    for(int n : base[i]) x += n ;
  }
  for(int i = 0 ; i < a.length ; i++) {
    for(int n : a[i]) y += n ;
  }
  return x == y * 2 ;
}

boolean isEqualNetwork(int[][] base, int[][] a) {
  for(int i = 0 ; i < a.length ; i++) {
    for(int j = i + 1 ; j < a[i].length ; j++) {
      if(base[i][j] != a[i][j] && base[i][j] != a[j][i]) return false ;
    }
  }
  return true ;
}

void arrayPrint(int[][]a) {
  for(int i = 0 ; i < a.length ; i++) {
    for(int n : a[i]) print(n + ",") ;
    println() ;
  }
}
