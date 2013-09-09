Feature: command line
  Background:
    Given I delete "test.csv"

  Scenario: generate cfd csv
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-25,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-23,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-31,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
     When I run the command "bin/kanban_metrics cfd test.csv"
     Then I see "2011-05-23,1,0,0,0\n2011-05-24,7,0,0,0\n2011-05-25,8,0,0,0\n2011-05-26,9,4,4,4\n2011-05-27,9,6,6,6\n2011-05-30,10,8,8,8\n2011-05-31,11,11,11,11"

  Scenario: generate cfd csv in a time window
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-25,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-23,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-31,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
     When I run the command "bin/kanban_metrics cfd test.csv 2011-05-26 2011-05-29"
     Then I see "2011-05-26,9,4,4,4\n2011-05-27,9,6,6,6"

  Scenario: generate cfd with partial data
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,"
      And the line in "test.csv" ",2011-05-24,2011-05-26,,"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,,,"
     When I run the command "bin/kanban_metrics cfd test.csv"
     Then I see "2011-05-24,5,0,0,0\n2011-05-26,6,2,1,1\n2011-05-27,6,3,2,2\n2011-05-30,7,5,4,3\n2011-05-31,7,6,5,3"

  Scenario: generate input output
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-25,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-23,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-31,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
     When I run the command "bin/kanban_metrics io test.csv"
     Then I see "week, in, out\n2011-21,6,5\n2011-22,5,6"

  Scenario: generate input output in a time window
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-25,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-23,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-31,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
     When I run the command "bin/kanban_metrics io test.csv 2011-05-07 2011-05-29"
     Then I see "week, in, out\n2011-21,6,5"

   Scenario: lead time histogram
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-25,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-23,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-31,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
     When I run the command "bin/kanban_metrics leadtime test.csv"
     Then I see "1,2\n3,4\n4,1\n5,3\n6,1"

  Scenario: lead time histogram in a time window
    Given the line in "test.csv" "id,committed,started,finished,delivered,type,back count,estimated time,spent time"
      And the line in "test.csv" ",2011-05-26,2011-05-27,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-30,2011-05-30,2011-05-30,2011-05-30"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
      And the line in "test.csv" ",2011-05-25,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-23,2011-05-27,2011-05-27,2011-05-27"
      And the line in "test.csv" ",2011-05-31,2011-05-31,2011-05-31,2011-05-31"
      And the line in "test.csv" ",2011-05-24,2011-05-26,2011-05-26,2011-05-26"
     When I run the command "bin/kanban_metrics leadtime test.csv 2011-05-07 2011-05-28"
     Then I see "3,4\n5,1"

   # Scenario: Little, stability, ageing

   # Scenario: phase based cycle time distribution

   # Scenario: flow efficiency

   # Scenario: deadline (behind?)