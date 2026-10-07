"
I represent the absence of en passant capture: the last move was not a two-square pawn move.
I never allow an en passant capture.
"
Class {
	#name : 'MyNoEnPassant',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyNoEnPassant >> allowsCaptureOn: aSquare by: aPawn [
	"No pawn has just moved two squares, so no en passant capture is possible"

	^ false
]

{ #category : 'capturing' }
MyNoEnPassant >> removeCapturedPawnFor: aPawn on: aSquare [
	"No en passant capture is possible: there is nothing to remove"

	^ self
]
