package graph

type Point int

type Edgenode struct {
	Y      Point
	Weight int
	Next   *Edgenode
}

type Graph struct {
	Edgenode  []Edges
	Degree    []int
	Nvertices int
	Nedges    int
	Directed  bool
}

func main() {
}
