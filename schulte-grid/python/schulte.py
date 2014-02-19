#!/usr/bin/env python  
import wx  

import random

import time
import datetime


DEFAULTE_SIZE = 5
SIZE = DEFAULTE_SIZE


class MyPanel(wx.Panel):
    def __init__(self, parent, id, Size):

        global SIZE 
        SIZE = Size
        # set the buttons
        # 
        self.parent = parent
        self.button = []
        for i in range(Size):
            for j in range(Size):
                self.button.append( 
                    wx.Button(
                        parent, 
                        label="", 
                        pos=(125 + i * 50 + (i - 1) * 10, 10 + j * 50 + (j - 1)*10), 
                        size=(50, 50)) )   
       
        # set num
        self.num = []
        for i in range(1, Size*Size+1 ):
            self.num.append(i)
        for i in range(Size*Size):
            k = random.choice(self.num)
            self.button[i].SetLabel(str(k))
            self.num.remove(k)

        # bind
        for i in range(Size*Size):
            self.button[i].Bind(wx.EVT_BUTTON, self.Click)

        self.starttime = datetime.datetime.now()

        self.target = 1

    def OnDestroy(self):
        self.Destroy()

    def Click(self, event):
        now = int(event.GetEventObject().GetLabel())
        if now == self.target:
            endtime = datetime.datetime.now()
            # interval=(endtime - starttime).seconds
            interval=(endtime - self.starttime)

            if now == SIZE * SIZE:
                showtime = wx.MessageDialog(None, str(interval), "GOOD", wx.YES_NO | wx.ICON_QUESTION)
                retCode = showtime.ShowModal()

                panelnew = MyPanel(self.parent, wx.NewId(), SIZE)
                self.panel.Destroy()
                self.panel = panelnew
                self.Update()

                showtime.Destroy()

            else:
                print time.clock()
                self.target += 1;


class InsertFrame(wx.Frame):  
    def __init__(self, parent, id): 

        wx.Frame.__init__(self, parent, id, 'Schulte Table', size=(700, 500))  

        ########################################
        menuBar = wx.MenuBar()
        
        menu = wx.Menu()
        
        m_3 = menu.Append(-1, "3*3", "")
        self.Bind(wx.EVT_MENU, self.Set3, m_3)
        m_4 = menu.Append(-1, "4*4", "")
        self.Bind(wx.EVT_MENU, self.Set4, m_4)
        m_5 = menu.Append(-1, "5*5", "")
        self.Bind(wx.EVT_MENU, self.Set5, m_5)
        m_6 = menu.Append(-1, "6*6", "")
        self.Bind(wx.EVT_MENU, self.Set6, m_6)
        m_7 = menu.Append(-1, "7*7", "")
        self.Bind(wx.EVT_MENU, self.Set7, m_7)
        m_8 = menu.Append(-1, "8*8", "")
        self.Bind(wx.EVT_MENU, self.Set8, m_8)
        m_9 = menu.Append(-1, "9*9", "")
        self.Bind(wx.EVT_MENU, self.Set9, m_9)

        m_exit = menu.Append(wx.ID_EXIT, "E&xit\tAlt-X", "Close window and exit program.")
        self.Bind(wx.EVT_MENU, self.OnCloseMe, m_exit)
        menuBar.Append(menu, "&Set")
        
        menu = wx.Menu()
        m_about = menu.Append(wx.ID_ABOUT, "&About", "Information about this program")
        self.Bind(wx.EVT_MENU, self.OnAbout, m_about)
        menuBar.Append(menu, "&Help")
        self.SetMenuBar(menuBar)
 
        #########################################
        self.statusbar = self.CreateStatusBar()

        #########################################
        self.panel = MyPanel(self, wx.NewId(), DEFAULTE_SIZE)

        self.Bind(wx.EVT_CLOSE, self.OnCloseWindow)  

    def Set3(self, event):
        
        panelnew = MyPanel(self, wx.NewId(), 3)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)

    def Set4(self, event):
        panelnew = MyPanel(self, wx.NewId(), 4)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)
    
    def Set5(self, event):
        panelnew = MyPanel(self, wx.NewId(), 5)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)
    
    def Set6(self, event):
        panelnew = MyPanel(self, wx.NewId(), 6)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)
    
    def Set7(self, event):
        panelnew = MyPanel(self, wx.NewId(), 7)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)
    
    def Set8(self, event):
        panelnew = MyPanel(self, wx.NewId(), 8)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)
    
    def Set9(self, event):
        panelnew = MyPanel(self, wx.NewId(), 9)
        self.panel.Destroy()
        self.panel.Update()
        self.panel = panelnew
        self.Update()
        self.panel.Show(True)
    
    def OnAbout(self, event):
        dlg = AboutBox()
        dlg.ShowModal()
        dlg.Destroy()





    def OnCloseMe(self, event):  
        self.Close(True)  
    def OnCloseWindow(self, event):  
        self.Destroy()  

if __name__ == '__main__':  
    app = wx.PySimpleApp()  
    frame = InsertFrame(parent=None, id=wx.NewId())  
    frame.Show()  
    app.MainLoop()  