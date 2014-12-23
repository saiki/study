package graph

type Point int

type Edgenode struct {
	Y      Point
	Weight int
	Next   *Edgenode
}

type Graph struct {
	Edgenode  map[Point]Edgenode
	Degree    []int
	Nvertices int
	Nedges    int
	Directed  bool
}

func NewGraph(directed bool) *Graph {
	g := new(Graph)
	g.Edgenode = make(map[Point]Edgenode)
	g.Nvertices = 0
	g.Nedges = 0
	g.Directed = directed
	return g
}

func (g Graph) Insert(x Point, edge *Edgenode) {

}

func main() {
}
