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

{ #category : 'helpers' }
MyPawnTest >> squareAt: aSquareName [
	"Return the square named aSquareName (exemple 'e3')"

	^ board at: aSquareName asString
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMovesTwoSquaresDownward [
	"Black pawns start on rank 7 and move down the board, from e7 they can reach e6 or e5."

	| pawn |
	pawn := self put: MyPawn black at: 'e7'.

	self assertSquares: pawn targetSquares areNamed: #( e6 e5 )
]

{ #category : 'tests' }
MyPawnTest >> testDoesNotMoveTwoSquaresAfterMovingOnce [
	"The two-square move is only allowed for the first move of the pawn.
	Once it has moved from e2 to e3, it can only move one square: e4."

	| pawn |
	pawn := self put: MyPawn white at: 'e2'.

	pawn moveTo: (self squareAt: 'e3').

	self assertSquares: pawn targetSquares areNamed: #( e4 )
]

{ #category : 'tests' }
MyPawnTest >> testDoesNotMoveTwoSquaresWhenThePathIsBlocked [
	"A pawn never jumps over a piece: if the square in front of it is occupied,
	it can move neither one nor two squares."
	
	| pawn |
	pawn := self put: MyPawn white at: 'e2'.
	self put: MyKnight white at: 'e3'.

	self assert: pawn targetSquares isEmpty
]

{ #category : 'tests' }
MyPawnTest >> testMoveTwoSquares [
	"From its starting rank, a white pawn can move one or two squares forward."

	| pawn |
	pawn := self put: MyPawn white at: 'e2'.

	self assertSquares: pawn targetSquares areNamed: #( e3 e4 )
]
