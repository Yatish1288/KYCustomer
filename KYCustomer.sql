USE [master]
GO
/****** Object:  Database [KYCustomer]    Script Date: 4/2/2020 1:01:21 PM ******/
CREATE DATABASE [KYCustomer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KYCustomer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\KYCustomer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KYCustomer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\KYCustomer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KYCustomer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KYCustomer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KYCustomer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KYCustomer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KYCustomer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KYCustomer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KYCustomer] SET ARITHABORT OFF 
GO
ALTER DATABASE [KYCustomer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KYCustomer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KYCustomer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KYCustomer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KYCustomer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KYCustomer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KYCustomer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KYCustomer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KYCustomer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KYCustomer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KYCustomer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KYCustomer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KYCustomer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KYCustomer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KYCustomer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KYCustomer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KYCustomer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KYCustomer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KYCustomer] SET  MULTI_USER 
GO
ALTER DATABASE [KYCustomer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KYCustomer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KYCustomer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KYCustomer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KYCustomer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KYCustomer] SET QUERY_STORE = OFF
GO
USE [KYCustomer]
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 4/2/2020 1:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInformation](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustFirstName] [varchar](50) NULL,
	[CustLastName] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[PhoneNo] [float] NULL,
	[Status] [bit] NULL,
	[RecordDate] [datetime] NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteInContactInformation]    Script Date: 4/2/2020 1:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author      : Yatish Mehta                                                                
-- Create date : 2020-01-04                                                                  
-- Description : To Perform the DML Operation on ContactInfomration                                                   
-- Tables used :  ContactInformation                                                                                                                            
-- =============================================                                                                                                                              
CREATE PROCEDURE [dbo].[USP_DeleteInContactInformation]                                                
(
@CID			 INT=0 
)
AS                                                                  
BEGIN 
     IF  EXISTS (SELECT * FROM ContactInformation WHERE CustomerId=@CID)  
        BEGIN            
			DELETE FROM ContactInformation   
                        WHERE  
                        CustomerId=@CID   
		 END
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertInContactInformation]    Script Date: 4/2/2020 1:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author      : Yatish Mehta                                                                
-- Create date : 2020-01-04                                                                  
-- Description : To Perform the DML Operation on ContactInfomration                                                   
-- Tables used :  ContactInformation                                                                                                                            
-- =============================================                                                                                                                              
CREATE PROCEDURE [dbo].[USP_InsertInContactInformation]                                                
   (         
           @CustFirstName   VARCHAR(50),                           
           @CustLastName    VARCHAR(50),                              
           @EmailId         VARCHAR(50),
		   @PhoneNo         FLOAT,
           @Status          BIT        
  )                                                          
AS                                                                  
BEGIN      
                                               
  INSERT INTO dbo.ContactInformation    
    		([CustFirstName]
           ,[CustLastName]
           ,[EmailId]
           ,[PhoneNo]
           ,[Status]
           ,[RecordDate])
               VALUES  
                       (@CustFirstName,@CustLastName,@EmailId,@PhoneNo,@Status,GETDATE())                              
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SelectInContactInformation]    Script Date: 4/2/2020 1:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author      : Yatish Mehta                                                                
-- Create date : 2020-01-04                                                                  
-- Description : To Perform the DML Operation on ContactInfomration                                                   
-- Tables used :  ContactInformation                                                                                                                            
-- =============================================                                                                                                                              
CREATE PROCEDURE [dbo].[USP_SelectInContactInformation]                                                
                      
AS                                                                  
BEGIN 
     Select CustomerId as SrNo, CustFirstName AS FirstName, CustLastName as LastName, EmailId, PhoneNo, Case When Status = 1 THEN 'Active' Else 'Inactive' End As CustomerStatus FROM ContactInformation                                                       
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateInContactInformation]    Script Date: 4/2/2020 1:01:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author      : Yatish Mehta                                                                
-- Create date : 2020-01-04                                                                  
-- Description : To Perform the DML Operation on ContactInfomration                                                   
-- Tables used :  ContactInformation                                                                                                                            
-- =============================================                                                                                                                              
CREATE PROCEDURE [dbo].[USP_UpdateInContactInformation]                                                
(
@CustFirstName   NVARCHAR(50),                           
@CustLastName    NVARCHAR(50),                              
@PhoneNo         Float,
@EmailId         VARCHAR(50),  
@Status          BIT,  
@CID			 INT 
)
AS                                                                  
BEGIN 
     IF  EXISTS (SELECT * FROM ContactInformation WHERE CustomerId=@CID)  
        BEGIN            
			UPDATE [dbo].[ContactInformation]
			SET [CustFirstName] = @CustFirstName
				,[CustLastName] = @CustLastName
			    ,[EmailId] = @EmailId
				,[PhoneNo] = @PhoneNo
				,[Status] = @Status   
				WHERE
				CustomerId=@CID
		 END
END
GO
USE [master]
GO
ALTER DATABASE [KYCustomer] SET  READ_WRITE 
GO
