// raid.flow
// 四区白三三
// 频道：帮派
// 关键字：dp
//@print (DPList)
[if] (DPList) == null
    pty 今天暂无帝魄统计记录。
[else]
    @js ($DPListNum) = [(DPList)].length
    @js ($DPListSort) = [(DPList)].sort()
    //@print (DPListSort)
    ($num1) = 0
    [while] (num1) < (DPListNum)
        ($count) = 0
        ($num2) = (num1)
        [while] (num2) < (DPListNum)
            @js ($dpPlayer1) = '(DPListSort)'.split(',')[(num1)]
            @js ($dpPlayer2) = '(DPListSort)'.split(',')[(num2)]
            @js ($dpYes) = '(dpPlayer1)'.indexOf('(dpStat)')
            [if] (dpYes) != -1
                [break]
            [else]
                [if] (dpPlayer1) == (dpPlayer2)
                    ($count) = (count) + 1
                ($num2) = (num2) + 1
        [if] (count) < 5
            [if] (dpStat) != null
                ($dpStat) = (dpStat)；(dpPlayer1)x(count)
            [else]
                ($dpStat) = (dpPlayer1)x(count)
        [else]
            [if] (dpStatFull) != null
                ($dpStatFull) = (dpStatFull)、(dpPlayer1)
            [else]
                ($dpStatFull) = (dpPlayer1)
        ($num1) = (num1) + (count)
    pty 帝魄统计：(dpStat)
    [if] (dpStatFull) != null
        @await 4000
        pty 帝魄已满：(dpStatFull)