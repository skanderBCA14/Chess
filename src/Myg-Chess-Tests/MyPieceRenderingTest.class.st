"
I check the letter used to draw each piece. It depends on the kind of piece, the color of the piece and the color of its square (light or dark).
"
Class {
	#name : 'MyPieceRenderingTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'asserting' }
MyPieceRenderingTest >> assertRenderingOf: aPieceClass is: someLetters [
	"someLetters are the expected letters for a white piece on a light square, a white piece on a dark square, a black piece on a light square, a black piece on a dark square"

	| lightSquare darkSquare |
	lightSquare := board at: 'a8'.
	darkSquare := board at: 'a1'.
	self assert: (aPieceClass white renderPieceOn: lightSquare) equals: someLetters first.
	self assert: (aPieceClass white renderPieceOn: darkSquare) equals: someLetters second.
	self assert: (aPieceClass black renderPieceOn: lightSquare) equals: someLetters third.
	self assert: (aPieceClass black renderPieceOn: darkSquare) equals: someLetters fourth
]

{ #category : 'running' }
MyPieceRenderingTest >> setUp [
	"Every test starts from a fresh empty board"

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests' }
MyPieceRenderingTest >> testBishopRendering [
	self assertRenderingOf: MyBishop is: #( 'B' 'b' 'V' 'v' )
]

{ #category : 'tests' }
MyPieceRenderingTest >> testKingRendering [
	self assertRenderingOf: MyKing is: #( 'K' 'k' 'L' 'l' )
]

{ #category : 'tests' }
MyPieceRenderingTest >> testKnightRendering [
	self assertRenderingOf: MyKnight is: #( 'N' 'n' 'M' 'm' )
]

{ #category : 'tests' }
MyPieceRenderingTest >> testPawnRendering [
	self assertRenderingOf: MyPawn is: #( 'P' 'p' 'O' 'o' )
]

{ #category : 'tests' }
MyPieceRenderingTest >> testQueenRendering [
	self assertRenderingOf: MyQueen is: #( 'Q' 'q' 'W' 'w' )
]

{ #category : 'tests' }
MyPieceRenderingTest >> testRookRendering [
	self assertRenderingOf: MyRook is: #( 'R' 'r' 'T' 't' )
]
