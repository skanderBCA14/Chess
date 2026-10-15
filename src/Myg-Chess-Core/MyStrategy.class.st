"
I choose the move a player plays (Strategy pattern).
"
Class {
	#name : 'MyStrategy',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'choosing' }
MyStrategy >> chooseAmong: someMoves [
	"The move to play among someMoves"

	^ self subclassResponsibility
]
