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
MyPawnTest >> pieceAt: aSquareName [
	"Return the piece standing on the square named aSquareName, or nil if the square is empty"

	^ (self squareAt: aSquareName) contents
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
MyPawnTest >> testBlackPawnCapturesDiagonallyDownward [
	"Black pawns move down the board, so they capture downward, from e5, on d4."

	| pawn |
	pawn := self put: MyPawn black at: 'e5'.
	self put: MyKnight white at: 'd4'.

	self assertSquares: pawn targetSquares areNamed: #( e4 d4 )
]

{ #category : 'tests' }
MyPawnTest >> testBlackPawnMovesTwoSquaresDownward [
	"Black pawns start on rank 7 and move down the board, from e7 they can reach e6 or e5."

	| pawn |
	pawn := self put: MyPawn black at: 'e7'.

	self assertSquares: pawn targetSquares areNamed: #( e6 e5 )
]

{ #category : 'tests' }
MyPawnTest >> testCapturesOnTheOnlyDiagonalOnTheEdgeOfTheBoard [
	"On the left edge of the board, a pawn has only one diagonal (b5): there is nothing to its left."

	| pawn |
	pawn := self put: MyPawn white at: 'a4'.
	self put: MyKnight black at: 'b5'.

	self assertSquares: pawn targetSquares areNamed: #( a5 b5 )
]

{ #category : 'tests' }
MyPawnTest >> testCapturesOnlyDiagonally [
	"A pawn captures one square diagonally forward, on both sides."

	| pawn |
	pawn := self put: MyPawn white at: 'e4'.
	self put: MyKnight black at: 'd5'.
	self put: MyKnight black at: 'f5'.

	self assertSquares: pawn targetSquares areNamed: #( e5 d5 f5 )
]

{ #category : 'tests' }
MyPawnTest >> testDoesNotCaptureItsOwnPieces [
	"A piece of its own color on a diagonal cannot be captured."

	| pawn |
	pawn := self put: MyPawn white at: 'e4'.
	self put: MyKnight white at: 'd5'.

	self assertSquares: pawn targetSquares areNamed: #( e5 )
]

{ #category : 'tests' }
MyPawnTest >> testDoesNotCaptureStraightAhead [
	"A pawn cannot capture the piece right in front of it, hat piece blocks it."

	| pawn |
	pawn := self put: MyPawn white at: 'e4'.
	self put: MyKnight black at: 'e5'.

	self assert: pawn targetSquares isEmpty
]

{ #category : 'tests' }
MyPawnTest >> testDoesNotCaptureStraightAheadWithTheTwoSquareMove [
	"The two-square move cannot capture either: an opponent piece on e4 only leaves e3."

	| pawn |
	pawn := self put: MyPawn white at: 'e2'.
	self put: MyKnight black at: 'e4'.

	self assertSquares: pawn targetSquares areNamed: #( e3 )
]

{ #category : 'tests' }
MyPawnTest >> testDoesNotMoveDiagonallyWithoutCapturing [
	"The diagonal move exists only to capture. 
	On an empty board, the pawn can only go straight ahead."

	| pawn |
	pawn := self put: MyPawn white at: 'e4'.

	self assertSquares: pawn targetSquares areNamed: #( e5 )
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
MyPawnTest >> testMoveStraightAheadOntoAPieceIsRefused [
	"Asking the pawn to move onto the piece in front of it does nothing, both pieces stay where they are."

	| pawn knight |
	pawn := self put: MyPawn white at: 'e4'.
	knight := self put: MyKnight black at: 'e5'.

	pawn moveTo: (self squareAt: 'e5').

	self assert: (self pieceAt: 'e4') identicalTo: pawn.
	self assert: (self pieceAt: 'e5') identicalTo: knight
]

{ #category : 'tests' }
MyPawnTest >> testMoveTwoSquares [
	"From its starting rank, a white pawn can move one or two squares forward."

	| pawn |
	pawn := self put: MyPawn white at: 'e2'.

	self assertSquares: pawn targetSquares areNamed: #( e3 e4 )
]
