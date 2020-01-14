# -*- coding: utf-8 -*-

import random as rnd
class Baseball:
    def __init__(self):
        flag = True
        self.base_num = []
        while flag:
            n1 = rnd.randrange(0, 10)
            if n1 not in self.base_num:
                self.base_num.append(n1)
            if self.base_num[0] == 0:
                del self.base_num[0]
            if len(self.base_num) == 4:
                flag = False
        
        for i in range(len(self.base_num)):
            self.base_num[i] = str(self.base_num[i])
        self.base_num = ''.join(self.base_num)
        pass
    
    def baseball_game(self):
        print("야구 게임 시작~!")
        chan = 0
        while (chan < 10):
            if chan == 9:
                print("마지막 기회!")
            chan += 1
            
            self.x = input('4자리 숫자 입력 : ')
            self.ball = 0
            self.strike = 0
            for idx, num in enumerate(self.x):
                for i, n in enumerate(self.base_num):
                    n = str(n)
                    if num == n:
                        if idx != i:
                            self.ball += 1
                        else:
                            self.strike += 1
                    else:
                        pass
            
            if self.strike == 4:
                print("정답!\n")
                break
            
            if self.x == 'black sheep wall':
                print('치트키 발동\n-> {}'.format(self.base_num))
            else:
                print("{}스트라이크 {}볼".format(self.strike, self.ball))
            
            if chan == 10:
                print("\n기회 다 씀!")
                print("다음에 다시 도전 하세요~~")
                chan += 1
        if chan <= 10:
            print("야구 게임 끝!!")
    pass
