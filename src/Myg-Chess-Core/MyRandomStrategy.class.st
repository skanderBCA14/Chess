"
I play any move, chosen at random
"
Class {
	#name : 'MyRandomStrategy',
	#superclass : 'MyStrategy',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'choosing' }
MyRandomStrategy >> chooseAmong: someMoves [
	"Any move, at random"

	^ someMoves atRandom
]
