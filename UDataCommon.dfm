object DataCommon: TDataCommon
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 571
  Top = 258
  Height = 280
  Width = 447
  object FConnection: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    SpecificOptions.Strings = (
      'MySQL.Charset=GBk')
    Server = '127.0.0.1'
    LoginPrompt = False
    Left = 160
    Top = 88
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 296
    Top = 88
  end
  object FCommonQry: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO rt_agree_info'
      
        '  (RT_AGREE_ID, RT_EFFECT_DAY, RT_EXPIRE_DAY, RT_AVAILABLE, RT_R' +
        'OOMER_ID, RT_ROOMER_INFO, RT_HOUSE_ID, RT_ROOM_ID, RT_ROOM_INFO,' +
        ' RT_TYPE, RT_RENT, RT_WATER, RT_ELECTOR, RT_NET_FEE, RT_CABLE_TV' +
        ', RT_COAL_GAS, RT_WATER_NUMBER, RT_METER_NUMER, RT_COAL_GAS_NUME' +
        'R, RT_CONST_FEE, RT_DEPOSIT, RESV1, TESV2, TESV3, INSERT_TIME, L' +
        'AST_UPT_TIME)'
      'VALUES'
      
        '  (:RT_AGREE_ID, :RT_EFFECT_DAY, :RT_EXPIRE_DAY, :RT_AVAILABLE, ' +
        ':RT_ROOMER_ID, :RT_ROOMER_INFO, :RT_HOUSE_ID, :RT_ROOM_ID, :RT_R' +
        'OOM_INFO, :RT_TYPE, :RT_RENT, :RT_WATER, :RT_ELECTOR, :RT_NET_FE' +
        'E, :RT_CABLE_TV, :RT_COAL_GAS, :RT_WATER_NUMBER, :RT_METER_NUMER' +
        ', :RT_COAL_GAS_NUMER, :RT_CONST_FEE, :RT_DEPOSIT, :RESV1, :TESV2' +
        ', :TESV3, :INSERT_TIME, :LAST_UPT_TIME)')
    SQLDelete.Strings = (
      'DELETE FROM rt_agree_info'
      'WHERE'
      '  RT_AGREE_ID = :Old_RT_AGREE_ID')
    SQLUpdate.Strings = (
      'UPDATE rt_agree_info'
      'SET'
      
        '  RT_AGREE_ID = :RT_AGREE_ID, RT_EFFECT_DAY = :RT_EFFECT_DAY, RT' +
        '_EXPIRE_DAY = :RT_EXPIRE_DAY, RT_AVAILABLE = :RT_AVAILABLE, RT_R' +
        'OOMER_ID = :RT_ROOMER_ID, RT_ROOMER_INFO = :RT_ROOMER_INFO, RT_H' +
        'OUSE_ID = :RT_HOUSE_ID, RT_ROOM_ID = :RT_ROOM_ID, RT_ROOM_INFO =' +
        ' :RT_ROOM_INFO, RT_TYPE = :RT_TYPE, RT_RENT = :RT_RENT, RT_WATER' +
        ' = :RT_WATER, RT_ELECTOR = :RT_ELECTOR, RT_NET_FEE = :RT_NET_FEE' +
        ', RT_CABLE_TV = :RT_CABLE_TV, RT_COAL_GAS = :RT_COAL_GAS, RT_WAT' +
        'ER_NUMBER = :RT_WATER_NUMBER, RT_METER_NUMER = :RT_METER_NUMER, ' +
        'RT_COAL_GAS_NUMER = :RT_COAL_GAS_NUMER, RT_CONST_FEE = :RT_CONST' +
        '_FEE, RT_DEPOSIT = :RT_DEPOSIT, RESV1 = :RESV1, TESV2 = :TESV2, ' +
        'TESV3 = :TESV3, INSERT_TIME = :INSERT_TIME, LAST_UPT_TIME = :LAS' +
        'T_UPT_TIME'
      'WHERE'
      '  RT_AGREE_ID = :Old_RT_AGREE_ID')
    SQLLock.Strings = (
      'SELECT * FROM rt_agree_info'
      'WHERE'
      '  RT_AGREE_ID = :Old_RT_AGREE_ID'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT rt_agree_info.RT_AGREE_ID, rt_agree_info.RT_EFFECT_DAY, r' +
        't_agree_info.RT_EXPIRE_DAY, rt_agree_info.RT_AVAILABLE, rt_agree' +
        '_info.RT_ROOMER_ID, rt_agree_info.RT_ROOMER_INFO, rt_agree_info.' +
        'RT_HOUSE_ID, rt_agree_info.RT_ROOM_ID, rt_agree_info.RT_ROOM_INF' +
        'O, rt_agree_info.RT_TYPE, rt_agree_info.RT_RENT, rt_agree_info.R' +
        'T_WATER, rt_agree_info.RT_ELECTOR, rt_agree_info.RT_NET_FEE, rt_' +
        'agree_info.RT_CABLE_TV, rt_agree_info.RT_COAL_GAS, rt_agree_info' +
        '.RT_WATER_NUMBER, rt_agree_info.RT_METER_NUMER, rt_agree_info.RT' +
        '_COAL_GAS_NUMER, rt_agree_info.RT_CONST_FEE, rt_agree_info.RT_DE' +
        'POSIT, rt_agree_info.RESV1, rt_agree_info.TESV2, rt_agree_info.T' +
        'ESV3, rt_agree_info.INSERT_TIME, rt_agree_info.LAST_UPT_TIME FRO' +
        'M rt_agree_info'
      'WHERE'
      '  rt_agree_info.RT_AGREE_ID = :RT_AGREE_ID')
    Connection = FConnection
    Left = 160
    Top = 144
  end
end
