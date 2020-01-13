#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Copyright 2019 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 


import numpy
from gnuradio import gr


QPSK = [-0.7071067690849304-0.7071067690849304j, -0.7071067690849304+0.7071067690849304j, 0.7071067690849304-0.7071067690849304j, 0.7071067690849304+0.7071067690849304j]; #Constellation points are defined for QPSK Modulation


QAM_16 = [-1.0015517473220825-1.0015517473220825j, -1.0015517473220825-0.33385059237480164j, -1.0015517473220825+0.33385059237480164j, -1.0015517473220825+1.0015517473220825j, -0.33385059237480164-1.0015517473220825j, -0.33385059237480164-0.33385059237480164j, -0.33385059237480164+0.33385059237480164j, -0.33385059237480164+1.0015517473220825j, 0.33385059237480164-1.0015517473220825j, 0.33385059237480164-0.33385059237480164j, 0.33385059237480164+0.33385059237480164j, 0.33385059237480164+1.0015517473220825j, 1.0015517473220825-1.0015517473220825j, 1.0015517473220825-0.33385059237480164j, 1.0015517473220825+0.33385059237480164j, 1.0015517473220825+1.0015517473220825j];#Constellation points are defined for 16-QAM Modulation


QAM_64 = [-1.1500126123428345-1.1500126123428345j, -1.1500126123428345-0.8214375972747803j, -1.1500126123428345-0.4928625524044037j, -1.1500126123428345-0.1642875224351883j, -1.1500126123428345+0.1642875224351883j, -1.1500126123428345+0.4928625524044037j, -1.1500126123428345+0.8214375972747803j, -1.1500126123428345+1.1500126123428345j, -0.8214375972747803-1.1500126123428345j, -0.8214375972747803-0.8214375972747803j, -0.8214375972747803-0.4928625524044037j, -0.8214375972747803-0.1642875224351883j, -0.8214375972747803+0.1642875224351883j, -0.8214375972747803+0.4928625524044037j, -0.8214375972747803+0.8214375972747803j, -0.8214375972747803+1.1500126123428345j, -0.4928625524044037-1.1500126123428345j, -0.4928625524044037-0.8214375972747803j, -0.4928625524044037-0.4928625524044037j, -0.4928625524044037-0.1642875224351883j, -0.4928625524044037+0.1642875224351883j, -0.4928625524044037+0.4928625524044037j, -0.4928625524044037+0.8214375972747803j, -0.4928625524044037+1.1500126123428345j, -0.1642875224351883-1.1500126123428345j, -0.1642875224351883-0.8214375972747803j, -0.1642875224351883-0.4928625524044037j, -0.1642875224351883-0.1642875224351883j, -0.1642875224351883+0.1642875224351883j, -0.1642875224351883+0.4928625524044037j, -0.1642875224351883+0.8214375972747803j, -0.1642875224351883+1.1500126123428345j, 0.1642875224351883-1.1500126123428345j, 0.1642875224351883-0.8214375972747803j, 0.1642875224351883-0.4928625524044037j, 0.1642875224351883-0.1642875224351883j, 0.1642875224351883+0.1642875224351883j, 0.1642875224351883+0.4928625524044037j, 0.1642875224351883+0.8214375972747803j, 0.1642875224351883+1.1500126123428345j, 0.4928625524044037-1.1500126123428345j, 0.4928625524044037-0.8214375972747803j, 0.4928625524044037-0.4928625524044037j, 0.4928625524044037-0.1642875224351883j, 0.4928625524044037+0.1642875224351883j, 0.4928625524044037+0.4928625524044037j, 0.4928625524044037+0.8214375972747803j, 0.4928625524044037+1.1500126123428345j, 0.8214375972747803-1.1500126123428345j, 0.8214375972747803-0.8214375972747803j, 0.8214375972747803-0.4928625524044037j, 0.8214375972747803-0.1642875224351883j, 0.8214375972747803+0.1642875224351883j, 0.8214375972747803+0.4928625524044037j, 0.8214375972747803+0.8214375972747803j, 0.8214375972747803+1.1500126123428345j, 1.1500126123428345-1.1500126123428345j, 1.1500126123428345-0.8214375972747803j, 1.1500126123428345-0.4928625524044037j, 1.1500126123428345-0.1642875224351883j, 1.1500126123428345+0.1642875224351883j, 1.1500126123428345+0.4928625524044037j, 1.1500126123428345+0.8214375972747803j, 1.1500126123428345+1.1500126123428345j];#Constellation points are defined for 64-QAM Modulation

QAm_256 = [-1.1500126123428345-1.1500126123428345j, -1.1500126123428345-0.8214375972747803j, -1.1500126123428345-0.4928625524044037j, -1.1500126123428345-0.1642875224351883j, -1.1500126123428345+0.1642875224351883j, -1.1500126123428345+0.4928625524044037j, -1.1500126123428345+0.8214375972747803j, -1.1500126123428345+1.1500126123428345j, -0.8214375972747803-1.1500126123428345j, -0.8214375972747803-0.8214375972747803j, -0.8214375972747803-0.4928625524044037j, -0.8214375972747803-0.1642875224351883j, -0.8214375972747803+0.1642875224351883j, -0.8214375972747803+0.4928625524044037j, -0.8214375972747803+0.8214375972747803j, -0.8214375972747803+1.1500126123428345j, -0.4928625524044037-1.1500126123428345j, -0.4928625524044037-0.8214375972747803j, -0.4928625524044037-0.4928625524044037j, -0.4928625524044037-0.1642875224351883j, -0.4928625524044037+0.1642875224351883j, -0.4928625524044037+0.4928625524044037j, -0.4928625524044037+0.8214375972747803j, -0.4928625524044037+1.1500126123428345j, -0.1642875224351883-1.1500126123428345j, -0.1642875224351883-0.8214375972747803j, -0.1642875224351883-0.4928625524044037j, -0.1642875224351883-0.1642875224351883j, -0.1642875224351883+0.1642875224351883j, -0.1642875224351883+0.4928625524044037j, -0.1642875224351883+0.8214375972747803j, -0.1642875224351883+1.1500126123428345j, 0.1642875224351883-1.1500126123428345j, 0.1642875224351883-0.8214375972747803j, 0.1642875224351883-0.4928625524044037j, 0.1642875224351883-0.1642875224351883j, 0.1642875224351883+0.1642875224351883j, 0.1642875224351883+0.4928625524044037j, 0.1642875224351883+0.8214375972747803j, 0.1642875224351883+1.1500126123428345j, 0.4928625524044037-1.1500126123428345j, 0.4928625524044037-0.8214375972747803j, 0.4928625524044037-0.4928625524044037j, 0.4928625524044037-0.1642875224351883j, 0.4928625524044037+0.1642875224351883j, 0.4928625524044037+0.4928625524044037j, 0.4928625524044037+0.8214375972747803j, 0.4928625524044037+1.1500126123428345j, 0.8214375972747803-1.1500126123428345j, 0.8214375972747803-0.8214375972747803j, 0.8214375972747803-0.4928625524044037j, 0.8214375972747803-0.1642875224351883j, 0.8214375972747803+0.1642875224351883j, 0.8214375972747803+0.4928625524044037j, 0.8214375972747803+0.8214375972747803j, 0.8214375972747803+1.1500126123428345j, 1.1500126123428345-1.1500126123428345j, 1.1500126123428345-0.8214375972747803j, 1.1500126123428345-0.4928625524044037j, 1.1500126123428345-0.1642875224351883j, 1.1500126123428345+0.1642875224351883j, 1.1500126123428345+0.4928625524044037j, 1.1500126123428345+0.8214375972747803j, 1.1500126123428345+1.1500126123428345j]

QAM_256 = [-1.226965069770813-1.226965069770813j, -1.226965069770813-1.0633697509765625j, -1.226965069770813-0.899774432182312j, -1.226965069770813-0.7361790537834167j, -1.226965069770813-0.5725836753845215j, -1.226965069770813-0.408988356590271j, -1.226965069770813-0.24539302289485931j, -1.226965069770813-0.08179767429828644j, -1.226965069770813+0.08179767429828644j, -1.226965069770813+0.24539302289485931j, -1.226965069770813+0.408988356590271j, -1.226965069770813+0.5725836753845215j, -1.226965069770813+0.7361790537834167j, -1.226965069770813+0.899774432182312j, -1.226965069770813+1.0633697509765625j, -1.226965069770813+1.226965069770813j, -1.0633697509765625-1.226965069770813j, -1.0633697509765625-1.0633697509765625j, -1.0633697509765625-0.899774432182312j, -1.0633697509765625-0.7361790537834167j, -1.0633697509765625-0.5725836753845215j, -1.0633697509765625-0.408988356590271j, -1.0633697509765625-0.24539302289485931j, -1.0633697509765625-0.08179767429828644j, -1.0633697509765625+0.08179767429828644j, -1.0633697509765625+0.24539302289485931j, -1.0633697509765625+0.408988356590271j, -1.0633697509765625+0.5725836753845215j, -1.0633697509765625+0.7361790537834167j, -1.0633697509765625+0.899774432182312j, -1.0633697509765625+1.0633697509765625j, -1.0633697509765625+1.226965069770813j, -0.899774432182312-1.226965069770813j, -0.899774432182312-1.0633697509765625j, -0.899774432182312-0.899774432182312j, -0.899774432182312-0.7361790537834167j, -0.899774432182312-0.5725836753845215j, -0.899774432182312-0.408988356590271j, -0.899774432182312-0.24539302289485931j, -0.899774432182312-0.08179767429828644j, -0.899774432182312+0.08179767429828644j, -0.899774432182312+0.24539302289485931j, -0.899774432182312+0.408988356590271j, -0.899774432182312+0.5725836753845215j, -0.899774432182312+0.7361790537834167j, -0.899774432182312+0.899774432182312j, -0.899774432182312+1.0633697509765625j, -0.899774432182312+1.226965069770813j, -0.7361790537834167-1.226965069770813j, -0.7361790537834167-1.0633697509765625j, -0.7361790537834167-0.899774432182312j, -0.7361790537834167-0.7361790537834167j, -0.7361790537834167-0.5725836753845215j, -0.7361790537834167-0.408988356590271j, -0.7361790537834167-0.24539302289485931j, -0.7361790537834167-0.08179767429828644j, -0.7361790537834167+0.08179767429828644j, -0.7361790537834167+0.24539302289485931j, -0.7361790537834167+0.408988356590271j, -0.7361790537834167+0.5725836753845215j, -0.7361790537834167+0.7361790537834167j, -0.7361790537834167+0.899774432182312j, -0.7361790537834167+1.0633697509765625j, -0.7361790537834167+1.226965069770813j, -0.5725836753845215-1.226965069770813j, -0.5725836753845215-1.0633697509765625j, -0.5725836753845215-0.899774432182312j, -0.5725836753845215-0.7361790537834167j, -0.5725836753845215-0.5725836753845215j, -0.5725836753845215-0.408988356590271j, -0.5725836753845215-0.24539302289485931j, -0.5725836753845215-0.08179767429828644j, -0.5725836753845215+0.08179767429828644j, -0.5725836753845215+0.24539302289485931j, -0.5725836753845215+0.408988356590271j, -0.5725836753845215+0.5725836753845215j, -0.5725836753845215+0.7361790537834167j, -0.5725836753845215+0.899774432182312j, -0.5725836753845215+1.0633697509765625j, -0.5725836753845215+1.226965069770813j, -0.408988356590271-1.226965069770813j, -0.408988356590271-1.0633697509765625j, -0.408988356590271-0.899774432182312j, -0.408988356590271-0.7361790537834167j, -0.408988356590271-0.5725836753845215j, -0.408988356590271-0.408988356590271j, -0.408988356590271-0.24539302289485931j, -0.408988356590271-0.08179767429828644j, -0.408988356590271+0.08179767429828644j, -0.408988356590271+0.24539302289485931j, -0.408988356590271+0.408988356590271j, -0.408988356590271+0.5725836753845215j, -0.408988356590271+0.7361790537834167j, -0.408988356590271+0.899774432182312j, -0.408988356590271+1.0633697509765625j, -0.408988356590271+1.226965069770813j, -0.24539302289485931-1.226965069770813j, -0.24539302289485931-1.0633697509765625j, -0.24539302289485931-0.899774432182312j, -0.24539302289485931-0.7361790537834167j, -0.24539302289485931-0.5725836753845215j, -0.24539302289485931-0.408988356590271j, -0.24539302289485931-0.24539302289485931j, -0.24539302289485931-0.08179767429828644j, -0.24539302289485931+0.08179767429828644j, -0.24539302289485931+0.24539302289485931j, -0.24539302289485931+0.408988356590271j, -0.24539302289485931+0.5725836753845215j, -0.24539302289485931+0.7361790537834167j, -0.24539302289485931+0.899774432182312j, -0.24539302289485931+1.0633697509765625j, -0.24539302289485931+1.226965069770813j, -0.08179767429828644-1.226965069770813j, -0.08179767429828644-1.0633697509765625j, -0.08179767429828644-0.899774432182312j, -0.08179767429828644-0.7361790537834167j, -0.08179767429828644-0.5725836753845215j, -0.08179767429828644-0.408988356590271j, -0.08179767429828644-0.24539302289485931j, -0.08179767429828644-0.08179767429828644j, -0.08179767429828644+0.08179767429828644j, -0.08179767429828644+0.24539302289485931j, -0.08179767429828644+0.408988356590271j, -0.08179767429828644+0.5725836753845215j, -0.08179767429828644+0.7361790537834167j, -0.08179767429828644+0.899774432182312j, -0.08179767429828644+1.0633697509765625j, -0.08179767429828644+1.226965069770813j, 0.08179767429828644-1.226965069770813j, 0.08179767429828644-1.0633697509765625j, 0.08179767429828644-0.899774432182312j, 0.08179767429828644-0.7361790537834167j, 0.08179767429828644-0.5725836753845215j, 0.08179767429828644-0.408988356590271j, 0.08179767429828644-0.24539302289485931j, 0.08179767429828644-0.08179767429828644j, 0.08179767429828644+0.08179767429828644j, 0.08179767429828644+0.24539302289485931j, 0.08179767429828644+0.408988356590271j, 0.08179767429828644+0.5725836753845215j, 0.08179767429828644+0.7361790537834167j, 0.08179767429828644+0.899774432182312j, 0.08179767429828644+1.0633697509765625j, 0.08179767429828644+1.226965069770813j, 0.24539302289485931-1.226965069770813j, 0.24539302289485931-1.0633697509765625j, 0.24539302289485931-0.899774432182312j, 0.24539302289485931-0.7361790537834167j, 0.24539302289485931-0.5725836753845215j, 0.24539302289485931-0.408988356590271j, 0.24539302289485931-0.24539302289485931j, 0.24539302289485931-0.08179767429828644j, 0.24539302289485931+0.08179767429828644j, 0.24539302289485931+0.24539302289485931j, 0.24539302289485931+0.408988356590271j, 0.24539302289485931+0.5725836753845215j, 0.24539302289485931+0.7361790537834167j, 0.24539302289485931+0.899774432182312j, 0.24539302289485931+1.0633697509765625j, 0.24539302289485931+1.226965069770813j, 0.408988356590271-1.226965069770813j, 0.408988356590271-1.0633697509765625j, 0.408988356590271-0.899774432182312j, 0.408988356590271-0.7361790537834167j, 0.408988356590271-0.5725836753845215j, 0.408988356590271-0.408988356590271j, 0.408988356590271-0.24539302289485931j, 0.408988356590271-0.08179767429828644j, 0.408988356590271+0.08179767429828644j, 0.408988356590271+0.24539302289485931j, 0.408988356590271+0.408988356590271j, 0.408988356590271+0.5725836753845215j, 0.408988356590271+0.7361790537834167j, 0.408988356590271+0.899774432182312j, 0.408988356590271+1.0633697509765625j, 0.408988356590271+1.226965069770813j, 0.5725836753845215-1.226965069770813j, 0.5725836753845215-1.0633697509765625j, 0.5725836753845215-0.899774432182312j, 0.5725836753845215-0.7361790537834167j, 0.5725836753845215-0.5725836753845215j, 0.5725836753845215-0.408988356590271j, 0.5725836753845215-0.24539302289485931j, 0.5725836753845215-0.08179767429828644j, 0.5725836753845215+0.08179767429828644j, 0.5725836753845215+0.24539302289485931j, 0.5725836753845215+0.408988356590271j, 0.5725836753845215+0.5725836753845215j, 0.5725836753845215+0.7361790537834167j, 0.5725836753845215+0.899774432182312j, 0.5725836753845215+1.0633697509765625j, 0.5725836753845215+1.226965069770813j, 0.7361790537834167-1.226965069770813j, 0.7361790537834167-1.0633697509765625j, 0.7361790537834167-0.899774432182312j, 0.7361790537834167-0.7361790537834167j, 0.7361790537834167-0.5725836753845215j, 0.7361790537834167-0.408988356590271j, 0.7361790537834167-0.24539302289485931j, 0.7361790537834167-0.08179767429828644j, 0.7361790537834167+0.08179767429828644j, 0.7361790537834167+0.24539302289485931j, 0.7361790537834167+0.408988356590271j, 0.7361790537834167+0.5725836753845215j, 0.7361790537834167+0.7361790537834167j, 0.7361790537834167+0.899774432182312j, 0.7361790537834167+1.0633697509765625j, 0.7361790537834167+1.226965069770813j, 0.899774432182312-1.226965069770813j, 0.899774432182312-1.0633697509765625j, 0.899774432182312-0.899774432182312j, 0.899774432182312-0.7361790537834167j, 0.899774432182312-0.5725836753845215j, 0.899774432182312-0.408988356590271j, 0.899774432182312-0.24539302289485931j, 0.899774432182312-0.08179767429828644j, 0.899774432182312+0.08179767429828644j, 0.899774432182312+0.24539302289485931j, 0.899774432182312+0.408988356590271j, 0.899774432182312+0.5725836753845215j, 0.899774432182312+0.7361790537834167j, 0.899774432182312+0.899774432182312j, 0.899774432182312+1.0633697509765625j, 0.899774432182312+1.226965069770813j, 1.0633697509765625-1.226965069770813j, 1.0633697509765625-1.0633697509765625j, 1.0633697509765625-0.899774432182312j, 1.0633697509765625-0.7361790537834167j, 1.0633697509765625-0.5725836753845215j, 1.0633697509765625-0.408988356590271j, 1.0633697509765625-0.24539302289485931j, 1.0633697509765625-0.08179767429828644j, 1.0633697509765625+0.08179767429828644j, 1.0633697509765625+0.24539302289485931j, 1.0633697509765625+0.408988356590271j, 1.0633697509765625+0.5725836753845215j, 1.0633697509765625+0.7361790537834167j, 1.0633697509765625+0.899774432182312j, 1.0633697509765625+1.0633697509765625j, 1.0633697509765625+1.226965069770813j, 1.226965069770813-1.226965069770813j, 1.226965069770813-1.0633697509765625j, 1.226965069770813-0.899774432182312j, 1.226965069770813-0.7361790537834167j, 1.226965069770813-0.5725836753845215j, 1.226965069770813-0.408988356590271j, 1.226965069770813-0.24539302289485931j, 1.226965069770813-0.08179767429828644j, 1.226965069770813+0.08179767429828644j, 1.226965069770813+0.24539302289485931j, 1.226965069770813+0.408988356590271j, 1.226965069770813+0.5725836753845215j, 1.226965069770813+0.7361790537834167j, 1.226965069770813+0.899774432182312j, 1.226965069770813+1.0633697509765625j, 1.226965069770813+1.226965069770813j]; # Constellation points are defined for 256-QAM Modulation

rs = -0.00-0j;   # Received symbol

class evm_qam_py_cf(gr.sync_block):
    """
    docstring for block evm_qam_py_cf
    """
    def __init__(self, modulation):
	self.modulation = modulation;
        gr.sync_block.__init__(self,
            name="evm_qam_py_cf",
            in_sig=[numpy.complex64],
            out_sig=[numpy.float32])

    def evm_qam(self, rs): 
	    rs = numpy.array([rs]);
            rs = rs.T;
	    if self.modulation == 0:
		nsymbols = 4;
		p1 = numpy.repeat(rs,nsymbols, axis =1);#repite los valores para completar los posibles simbolos de la constelación
		d = (numpy.real(QPSK) - numpy.real(p1))**2 + (numpy.imag(QPSK) - numpy.imag(p1))**2;#calcula la diferencia entre los puntos ideales y los recibidos en valores positivos siempre (por eso al cuadrado)
		d_min =  numpy.min(d,axis=1); # estima el punto mas cercano
		return numpy.sqrt(d_min/2)*100;

	    elif self.modulation == 1:
		nsymbols = 16;
		p1 = numpy.repeat(rs,nsymbols, axis =1);
		d = (numpy.real(QAM_16) - numpy.real(p1))**2 + (numpy.imag(QAM_16) - numpy.imag(p1))**2;
		d_min =  numpy.min(d,axis=1);
		return numpy.sqrt(d_min/2)*100;

	    elif self.modulation == 2:
		nsymbols = 64;
		p1 = numpy.repeat(rs,nsymbols, axis =1);
		d = (numpy.real(QAM_64) - numpy.real(p1))**2 + (numpy.imag(QAM_64) - numpy.imag(p1))**2;
		d_min =  numpy.min(d,axis=1);
		return numpy.sqrt(d_min/2)*100;

	    elif self.modulation == 3:
		nsymbols = 256;
		p1 = numpy.repeat(rs,nsymbols, axis =1);
		d = (numpy.real(QAM_256) - numpy.real(p1))**2 + (numpy.imag(QAM_256) - numpy.imag(p1))**2;
		d_min =  numpy.min(d,axis=1);
		return numpy.sqrt(d_min/2)*100;
	    else: 
		print('Make sure you have choosen the correct modulation!')
		return 100000;


    def work(self, input_items, output_items):
        in0 = input_items[0]
        out = output_items[0]
        # <+signal processing here+>
        out[:] = self.evm_qam(in0);
        return len(output_items[0])
