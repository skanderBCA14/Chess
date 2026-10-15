"
I capture a piece when I can, otherwise I play any move.
"
Class {
	#name : 'MyCaptureFirstStrategy',
	#superclass : 'MyStrategy',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'choosing' }
MyCaptureFirstStrategy >> chooseAmong: someMoves [
	"A capture if there is one, otherwise any move"

	^ (self preferredAmong: someMoves) atRandom
]

{ #category : 'choosing' }
MyCaptureFirstStrategy >> preferredAmong: someMoves [
	"The captures, or all the moves when there is no capture"

	^ (someMoves select: [ :each | each isCapture ]) ifEmpty: [ someMoves ]
]
