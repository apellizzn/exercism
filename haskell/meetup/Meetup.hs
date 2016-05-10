module Meetup
  (
    Weekday(..),
    Schedule(..),
    meetupDay
  ) where

    import Data.Time.Calendar
    import Data.Time.Calendar.WeekDate

    data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday  deriving (Eq, Bounded, Enum)
    data Schedule = First | Second | Third | Fourth | Teenth | Last deriving (Eq)

    meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
    meetupDay schedule weekday year month = fromGregorian year month correctDay
      where (_, _, correctDay) = toGregorian $ find weekday startDay upOrDown
            startDay = addDays offset baseDay
            offset =  case schedule of
              Second -> 7
              Third  -> 7 * 2
              Fourth -> 7 * 3
              Teenth -> 12
              _   -> 0
            baseDay = case schedule of
              Last -> fromGregorian year month (gregorianMonthLength year month)
              _ -> fromGregorian year month 1
            upOrDown = case schedule of
              Last -> -1
              _ -> 1

    find :: Weekday -> Day -> Integer -> Day
    find weekday day interval
      | [Monday ..] !! (weekDay - 1) == weekday = day
      | otherwise = find weekday (addDays interval day) interval
      where (_, _, weekDay) = toWeekDate day
