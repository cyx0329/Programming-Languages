module Hwk7Q3 where
import qualified Data.List

data Expr = Add Expr Expr
          | Sub Expr Expr
          | Mult Expr Expr
		  | Divi Expr Expr
		  |	Not Expr
		  | And Expr Expr
		  | Or Expr Expr
		  | Equals Expr Expr
		  | Gt Expr Expr
		  | Lte Expr Expr

          | Const Integer
          | VarName String
          | TrueE
          | FalseE
  deriving (Show,Eq) -- disregard this for now.
  
data Stmt = Assign String Expr
		  | While Expr Stmt 
		  | If Expr Stmt
		  | IfElse Expr Stmt Stmt
		  |	Skip
		  | Seq Stmt Stmt
	deriving (Show)

stmt_1 = Assign ("i") (Const 0)
stmt_2 = Assign ("z") (Const 1)
stmt_3 = While (Gt (VarName "y") (VarName "i")) (Seq (Assign ("z") (Mult (VarName "z") (VarName "x"))) (Assign ("i") (Add (VarName "i") (Const 1))))

exponentAST = Seq (Seq stmt_1 stmt_2) stmt_3

stmt_4 = Assign ("low") (Const 1)
stmt_5 = Assign ("up") (VarName "n")
stmt_6 = Assign ("acc") (Const 1)
stmt_7 = Assign ("guess") (Divi (Add (VarName "low") (VarName "up")) (Const 2))
stmt_8 = Seq (Seq (Seq stmt_4 stmt_5) stmt_6) stmt_7
stmt_9 = IfElse (Gt (Mult (VarName "guess") (VarName "guess")) (VarName "n")) (Assign ("up") (VarName "guess")) (Assign ("low") (VarName "guess"))
stmt_10 = While (Gt (Sub (VarName "up") (VarName "low")) (VarName "acc")) (Seq (Assign ("guess") (Divi (Add (VarName "low") (VarName "up")) (Const 2))) stmt_6)

gcdAST = Seq stmt_8 stmt_10

type State = [ (String, Integer) ]

env = [ ("x", 4), ("y", 3), ("z", 0) ]

update :: String -> Integer -> State -> State

update v i env  

  = case lookup v env of

      Nothing -> Data.List.insert (v, i) env

      Just x -> map (\ y -> if y == (v, x) then (v, i) else y) env

notop a 
	| a == 0 = 1
	| otherwise = 0

andop a b
	| (a /= 0) && (b /= 0) = 1
	| otherwise = 0

orop a b
	| (a == 0) || (b ==0) = 0
	| otherwise = 1

equalsop a b 
	| a == b = 1
	| otherwise = 0
	
gtop a b
	| a > b = 1
	| otherwise = 0

lteop a b
	| a == b = 1
	| otherwise = 0

eval :: Expr -> [(String, Integer)] -> Integer
eval (Add e1 e2) env = eval e1 env + eval e2 env
eval (Sub e1 e2) env = eval e1 env - eval e2 env
eval (Mult e1 e2) env = eval e1 env * eval e2 env
eval (Divi e1 e2) env = div (eval e1 env) (eval e2 env)	
eval (Not e) env = notop (eval e env) 
eval (And e1 e2) env = andop (eval e1 env) (eval e2 env)
eval (Or e1 e2) env = orop (eval e1 env) (eval e2 env) 
eval (Equals e1 e2) env = equalsop (eval e1 env) (eval e2 env) 
eval (Gt e1 e2) env = gtop (eval e1 env) (eval e2 env)
eval (Lte e1 e2) env = lteop (eval e1 env) (eval e2 env)

eval (Const x) _ = x
eval (VarName v) env 
  = case lookup v env of
      Nothing -> error ("Undefined variable \"" ++ v ++ "\".")
      Just x -> x
eval TrueE _ = 1
eval FalseE _ = 0

exec :: Stmt -> State -> State

exec (Assign v e) env = update v (eval e env) env

exec (While e s) env = if (eval e env) > 0 then exec (While e s) (exec s env) else env

exec (Seq s1 s2) env = exec s2 (exec s1 env)

exec (If e s) env = if (eval e env) > 0 then exec s env else env

exec (IfElse e s1 s2) env = if (eval e env) > 0 then exec s1 env else exec s2 env

exec Skip env = env

run :: Stmt -> State -> State

run s env = filter (\ x -> elem (fst x) var ) (exec s env)

	where var = map (\ x -> (fst x)) env			



