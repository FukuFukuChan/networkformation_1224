void setup() {
  Network network = new Network(1, 2.4) ;
  network.setFriendSet(0.5) ;
  println("<Instance F>") ;
  arrayPrint(network.friendSet) ;
  println("isFeasible : " + network.isFeasible()) ;
  network.relationSet = network.friendSet ;
  println("diameter : " + network.getDiameter()) ;
  network.relationSet = new int[network.allPlayer.size()][network.allPlayer.size()] ;
  float start = millis() ;
  network.deviation() ;
  float end = millis() - start ;
  println("----------------------------------------------") ;
  println("<Outcome F'>") ;
  arrayPrint(network.relationSet) ;
  println("<DistanceCost>") ;
  for(Player pp : network.allPlayer) {
    int[]dist = pp.getDistanceCost() ;
    print(pp.index + ":") ;
    for(int i = 0 ; i < dist.length ; i++) {
      print("[" + i + "]" + dist[i] + ",") ;
    }
    println() ;
  }
  // println("<Cost>") ;
  // for(Player p : network.allPlayer) {
  //   println("[" + p.index + "]Cost : " + p.calCost()) ;
  // }
  // print("time : ") ;
  // println(end / 1000 + "秒") ;
  //println("diameter : " + network.getDiameter()) ;
  println("isStable : " + network.isStable()) ;
  println("diameter : " + network.getDiameter()) ;
  // println("deviationCount : " + network.deviationCount) ;
  // println("F = F' : " + isEqualNetwork(network.friendSet, network.relationSet)) ;
  exit() ;
}

  boolean isEqualNetwork(int[][] base, int[][] a) {
    for(int i = 0 ; i < a.length ; i++) {
      for(int j = i + 1 ; j < a[i].length ; j++) {
        if (base[i][j] != a[i][j] && base[i][j] != a[j][i]) return false ;
      }
    }
    return true ;
  }

  void arrayPrint(int[][] a) {
    for(int i = 0 ; i < a.length ; i++) {
      for(int n : a[i]) print(n + ",") ;
      println() ;
    }
  }
