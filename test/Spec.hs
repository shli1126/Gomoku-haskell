
import Test.HUnit
import Logic
-- Assuming the definitions of isWin and updateBoard are somewhere in your code

-- Test cases
test1 :: Test
test1 = TestCase (assertEqual "for (isWin testDiag4Board)," False (isWin testDiag4Board))

test2 :: Test
test2 = TestCase (assertEqual "" True (isWin testDiag1Board))

test3 = TestCase (assertEqual "" False (isWin testDiag2Board))

test4 = TestCase (assertEqual "" True (isWin testDiag3Board))

-- Test List
tests :: Test
tests = TestList [TestLabel "test1" test1,  test2,  test3, test4, test5, testTie1]

-- Main method to run the tests
main :: IO Counts
main = runTestTT tests

testDiag1Board :: [[Int]]
testDiag1Board = [[-1,1,-1,-1,-1,-1],
                  [-1,-1,1,-1,-1,-1],
                  [-1,-1,-1,1,-1,-1],
                  [-1,-1,-1,-1,1,-1],
                  [-1,-1,-1,-1,-1,1],
                  [-1,-1,-1,-1,-1,-1]]

testDiag2Board :: [[Int]]
testDiag2Board = [[-1,-1, 1,-1,-1,-1],
                  [-1,-1,-1, 1,-1,-1],
                  [-1,-1,-1,-1, 1,-1],
                  [-1,-1,-1,-1,-1, 1],
                  [1,-1,-1,-1,-1,-1],
                  [-1,1,-1,-1,-1,-1]]

testDiag3Board :: [[Int]]
testDiag3Board = [[-1,-1, 1,-1,1,-1],
                  [-1,-1,-1, 1,-1,-1],
                  [-1,-1,1,-1, 1,-1],
                  [-1,1,-1,-1,-1, 1],
                  [1,-1,-1,-1,-1,-1],
                  [-1,-1,-1,-1,-1,-1]]

testDiag4Board :: [[Int]]
testDiag4Board = [[-1,-1, 1,-1,0,-1],
                  [-1,0,1, 1,1,1],
                  [-1,-1,1,-1, 1,-1],
                  [-1,1,-1,-1,0, 1],
                  [-1,-1,-1,-1,1,-1],
                  [-1,-1,-1,-1,1,-1]]


-- >>> isWin testDiag4Board
-- False

updateBoardTest :: [[Int]]
updateBoardTest = updateBoard testDiag4Board (1, 2) 4

updatedBoard = [[-1,-1,1,-1,0,-1],[-1,0,1,1,1,1],[-1,4,1,-1,1,-1],[-1,1,-1,-1,0,1],[-1,-1,-1,-1,1,-1],[-1,-1,-1,-1,1,-1]]

test5 = TestCase (assertEqual "" updatedBoard updateBoardTest)


testTie = [[0,1,0,1,0,1],
           [1,0,1,0,1,0],
           [0,1,0,1,0,1],
           [1,0,1,0,1,0],
           [0,1,0,1,0,1],
           [1,0,1,0,1,0]]

testTie1 = TestCase (assertEqual "" True (isTie testTie))