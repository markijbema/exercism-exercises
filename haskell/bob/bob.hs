module Bob (responseFor) where
import Data.Char (isSpace, isLower, isUpper)

data Message = Question | Shout | Silence | OtherMessage

responseFor :: String -> String
responseFor = messageResponse . messageType

messageType :: String -> Message
messageType s
  | all isSpace s                        = Silence
  | noLowerCase s && containsUppercase s = Shout
  | last s == '?'                        = Question
  | otherwise                            = OtherMessage

messageResponse :: Message -> String
messageResponse Shout    = "Woah, chill out!"
messageResponse Question = "Sure."
messageResponse Silence  = "Fine. Be that way!"
messageResponse OtherMessage        = "Whatever."

containsUppercase :: String -> Bool
containsUppercase = any isUpper

noLowerCase :: String -> Bool
noLowerCase = not . any isLower
