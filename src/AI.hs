{-# LANGUAGE ScopedTypeVariables #-}

{-|
Module      : AI
Description : AIs for KangaroosAndWombats
Copyright   : (c) 2023 Jack Kelly / James Bacon / Nicholas Meihlbradt / 
                   Donovan Crichton
License     : AllRightsReserved
-}
module AI where

import           KangaroosAndWombats

-- | Type of AI functions you can choose to write.
data AIFunc
  = NoLookahead (GameState -> Move)
-- ^ Simple AIs that do not need lookahead.
  | WithLookahead (GameState -> Int -> Move)
-- ^ AIs that want to look ahead. The assignment framework will
-- call the function over and over with increasing integer
-- arguments @1, 2, 3, ...@ until your AI's time limit is up.

-- | The table of all AIs that your assignment provides. The AI named
-- "default" in this table is the one your tutor will dedicate most of
-- their attention to marking.
ais :: \[(String, AIFunc)]
ais = \[ ("default", NoLookahead firstLegalMove)
  ]

-- | A very simple AI, which picks the first move returned by the
-- 'legalMoves' function. AIs can rely on the 'legalMoves' list being
-- non-empty; if there were no legal moves, the framework would have
-- ended the game.
firstLegalMove :: GameState -> Move
firstLegalMove state = head (legalMoves state)

