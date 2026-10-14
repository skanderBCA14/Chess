Class {
	#name : 'MyNoPieceTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyNoPieceTest >> setUp [

	super setUp.
	board := MyChessBoard empty
]

{ #category : 'tests' }
MyNoPieceTest >> testARealPieceIsAPiece [

	self assert: MyRook white isPiece
]

{ #category : 'tests' }
MyNoPieceTest >> testHasNoTargetSquares [

	self assert: MyNoPiece new targetSquares isEmpty
]

{ #category : 'tests' }
MyNoPieceTest >> testIsNotAPiece [

	self deny: MyNoPiece new isPiece
]

{ #category : 'tests' }
MyNoPieceTest >> testRenderingOnADarkSquare [

	self assert: (MyNoPiece new renderPieceOn: (board at: 'a1')) equals: 'x'
]

{ #category : 'tests' }
MyNoPieceTest >> testRenderingOnALightSquare [

	self assert: (MyNoPiece new renderPieceOn: (board at: 'a8')) equals: 'z'
]
