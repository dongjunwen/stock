unit ULoginUser;

interface
  {用户信息类}
  Type TUserInfo=class
     private
       _userId:string;
       _userName:string;
       _userPass:string;
       _userRole:String;
     protected  
     public
           constructor create();
     published
       property UserId:String   read _userId write _userId;
       property UserName:string read _userName write _userName;
       property UserPass:String read _userPass write _userPass;
       property UserRole:String read _userRole write _userRole;
  end;

  {登录信息类}
  type TLoginInfo=class
    private
       _user:TUserInfo;
       _ip:string;
       _loginTime:String;
       //_Fconnection:String;
     protected

     public
          constructor create();
     published
       property User:TUserInfo   read _user write _user;
       property IP:string read _ip write _ip;
       property LoginTime:String read _loginTime write _loginTime;
  end;

  {出入库信息}
  type TStorInfo=class
     private
         _user:TUserInfo;
         _formType:String; //表单类型
         _formNo:String;   //表单编号
         _matNo:String;    //物料编号
         _matName:String;  //物料名称
         _storNo:String;   //出入库编号
         _storNum:Integer;   //出入库数量
         _matType:String;    //0:SN管理 1：批号
     protected
     
     public
          constructor create();
     published
       property User:TUserInfo   read _user write _user;
       property FormType:String read _formType write _formType;
       property FormNo:String read _formNo write _formNo;
       property MatNo:String read _matNo write _matNo;
       property MatName:String read _matName write _matName;
        property MatType:String read _matType write _matType;
       property StorNo:String read _storNo write _storNo;
       property StorNum:Integer read _storNum write _storNum;
  end;
implementation

constructor TUserInfo.create;
begin
    
end;

constructor TLoginInfo.create;
begin
    
end;

constructor TStorInfo.create;
begin
    
end;

end.
 