Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'helpers' }
MyPawnTest >> assertSquares: someSquares areNamed: someSquareNames [
	"Check that someSquares are EXACTLY the squares named in someSquareNames, no square missing and no extra square, in any order"

	self
		assertCollection: someSquares
		hasSameElements: (someSquareNames collect: [ :name | board at: name asString ])
]

{ #category : 'helpers' }
MyPawnTest >> put: aPiece at: aSquareName [
	"Place aPiece on the square named aSquareName (exemple 'e2') and return the piece"

	board at: aSquareName asString put: aPiece.
	^ aPiece
]

{ #category : 'running' }
MyPawnTest >> setUp [
	"Every test starts from a fresh empty board"

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMovesTwoSquaresDownward [
	"Black pawns start on rank 7 and move down the board, from e7 they can reach e6 or e5."

	| pawn |
	pawn := self put: MyPawn black at: 'e7'.

	self assertSquares: pawn targetSquares areNamed: #( e6 e5 )
]

{ #category : 'tests' }
MyPawnTest >> testMoveTwoSquares [
	"From its starting rank, a white pawn can move one or two squares forward."

	| pawn |
	pawn := self put: MyPawn white at: 'e2'.

	self assertSquares: pawn targetSquares areNamed: #( e3 e4 )
]
