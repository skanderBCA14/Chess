Class {
	#name : 'MyStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyStrategyTest >> setUp [

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests' }
MyStrategyTest >> testCaptureFirstStrategyChoosesTheCapture [

	| rook capture moves |
	board at: 'a1' put: (rook := MyRook white).
	board at: 'a5' put: MyPawn black.
	capture := MyMove piece: rook to: (board at: 'a5').
	moves := {
		         (MyMove piece: rook to: (board at: 'a2')).
		         capture.
		         (MyMove piece: rook to: (board at: 'b1')) }.

	self assert: (MyCaptureFirstStrategy new chooseAmong: moves) identicalTo: capture
]

{ #category : 'tests' }
MyStrategyTest >> testCaptureFirstStrategyPlaysAnyMoveWithoutCapture [

	| rook moves |
	board at: 'a1' put: (rook := MyRook white).
	moves := {
		         (MyMove piece: rook to: (board at: 'a2')).
		         (MyMove piece: rook to: (board at: 'b1')) }.

	self assert: (moves includes: (MyCaptureFirstStrategy new chooseAmong: moves))
]

{ #category : 'tests' }
MyStrategyTest >> testMoveOntoAnEmptySquareIsNotACapture [

	| rook |
	board at: 'a1' put: (rook := MyRook white).

	self deny: (MyMove piece: rook to: (board at: 'a5')) isCapture
]

{ #category : 'tests' }
MyStrategyTest >> testMoveOntoAnOpponentIsACapture [

	| rook |
	board at: 'a1' put: (rook := MyRook white).
	board at: 'a5' put: MyPawn black.

	self assert: (MyMove piece: rook to: (board at: 'a5')) isCapture
]

{ #category : 'tests' }
MyStrategyTest >> testRandomStrategyChoosesOneOfTheMoves [

	| rook moves |
	board at: 'a1' put: (rook := MyRook white).
	moves := {
		         (MyMove piece: rook to: (board at: 'a2')).
		         (MyMove piece: rook to: (board at: 'b1')) }.

	self assert: (moves includes: (MyRandomStrategy new chooseAmong: moves))
]
