"
I check how the game behaves with empty squares.
"
Class {
	#name : 'MyEmptySquareTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyEmptySquareTest >> setUp [

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests' }
MyEmptySquareTest >> testClickingAfterSelectingAnEmptySquareUnselectsIt [

	| state |
	state := (MyUnselectedState board: board) clickOn: (board at: 'e4').
	state := state clickOn: (board at: 'e5').

	self assert: state class identicalTo: MyUnselectedState
]

{ #category : 'tests' }
MyEmptySquareTest >> testClickingAnEmptySquareSelectsIt [

	| state |
	state := (MyUnselectedState board: board) clickOn: (board at: 'e4').

	self assert: state class identicalTo: MySelectedState
]

{ #category : 'tests' }
MyEmptySquareTest >> testEmptySquareHasNoPiece [

	self deny: (board at: 'e4') hasPiece
]

{ #category : 'tests' }
MyEmptySquareTest >> testSquareIsEmptyAfterThePieceLeaves [

	| rook |
	board at: 'e4' put: (rook := MyRook white).

	rook moveTo: (board at: 'e6').

	self deny: (board at: 'e4') hasPiece
]

{ #category : 'tests' }
MyEmptySquareTest >> testSquareWithAPieceHasAPiece [

	board at: 'e4' put: MyRook white.

	self assert: (board at: 'e4') hasPiece
]
