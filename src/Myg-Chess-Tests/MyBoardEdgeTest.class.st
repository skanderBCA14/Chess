"
I check the moves of pieces near the edges of the board: they never target a square outside the board.
"
Class {
	#name : 'MyBoardEdgeTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'helpers' }
MyBoardEdgeTest >> assertSquares: someSquares areNamed: someSquareNames [
	"Check that someSquares are exactly the squares named in someSquareNames, in any order"

	self
		assertCollection: someSquares
		hasSameElements: (someSquareNames collect: [ :name | board at: name asString ])
]

{ #category : 'running' }
MyBoardEdgeTest >> setUp [

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests' }
MyBoardEdgeTest >> testKingMovesFromACorner [

	| king |
	board at: 'a1' put: (king := MyKing white).
	self assertSquares: king targetSquares areNamed: #( a2 b1 b2 )
]

{ #category : 'tests' }
MyBoardEdgeTest >> testKingMovesFromTheCenter [

	| king |
	board at: 'e4' put: (king := MyKing white).
	self assertSquares: king targetSquares areNamed: #( d3 d4 d5 e3 e5 f3 f4 f5 )
]

{ #category : 'tests' }
MyBoardEdgeTest >> testKnightMovesFromACorner [

	| knight |
	board at: 'a1' put: (knight := MyKnight white).
	self assertSquares: knight targetSquares areNamed: #( b3 c2 )
]

{ #category : 'tests' }
MyBoardEdgeTest >> testKnightMovesFromTheCenter [

	| knight |
	board at: 'd4' put: (knight := MyKnight white).
	self assertSquares: knight targetSquares areNamed: #( b3 b5 c2 c6 e2 e6 f3 f5 )
]

{ #category : 'tests' }
MyBoardEdgeTest >> testKnightMovesFromTheOppositeCorner [

	| knight |
	board at: 'h8' put: (knight := MyKnight black).
	self assertSquares: knight targetSquares areNamed: #( f7 g6 )
]

{ #category : 'tests' }
MyBoardEdgeTest >> testRookMovesFromACorner [

	| rook |
	board at: 'a1' put: (rook := MyRook white).
	self assertSquares: rook targetSquares areNamed: #( a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1 )
]
