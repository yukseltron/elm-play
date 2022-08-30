module Main exposing (..)
import Browser
import Color exposing (..)
import Collage exposing (..)
import Element exposing (..)
import Time exposing (..)

main = Signal.map animate (every millisecond)

animate t = collage 300 300
  [ batman
  |> move ((50*(sin (t/1000))),(50*(cos (t/1000))))
  |> rotate (10*(t/5000))
  |> scale ((abs(sin (t/500))) + 0.7)
  ]

batman = group
    [ move (0,0) (filled black (circle 400))
    , move (0,0) (filled darkGrey (circle 190))
    , move (0,0) (filled white (circle 180))
    , move (0,0) (filled darkGreen (circle 170))
    , move (0,0) (filled green (circle 160))
    , move (0,0) (filled blue (circle 150))
    , move (0,0) (filled darkBlue (circle 140))
    , move (0,0) (filled yellow (circle 130))
    , move (0,0) (filled darkYellow (circle 120))
    , move (0,0) (filled red (circle 110))
    , move (0,0) (filled lightRed (circle 100))
    , move (0,0) (filled black (circle 50))
    , move (0,0) (filled skinColor (circle 50)) |> scale 0.9
    , move (0,-4) (filled black (polygon [(-10,0),(0,-5),(10,0),(3,10),(-3,10)])) |> scale 5
    , move (29,35) (filled black (ngon 3 30)) |> rotate (degrees 70)
    , move (-29,35) (filled black (ngon 3 30)) |> rotate (degrees 110)
    , move (25,0) (filled white (oval 40 20)) |> rotate (degrees 30)
    , move (25,8) (filled black (rect 45 15)) |> rotate (degrees 20)
    , move (-25,0) (filled white (oval 40 20)) |> rotate (degrees 150)
    , move (-25,8) (filled black (rect 45 15)) |> rotate (degrees 160)
    , move (0,-35) (filled black (rect 20 2))
    , move (-12,-36) (filled black (rect 5 2)) |> rotate (degrees 20)
    , move (12,-36) (filled black (rect 5 2)) |> rotate (degrees 160)
    ]

skinColor = hsl 0.17 1 0.74
