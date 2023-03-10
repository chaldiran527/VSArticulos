USE [master]
GO
/****** Object:  Database [PruebaConcepto]    Script Date: 10/3/2023 10:59:17 ******/
CREATE DATABASE [PruebaConcepto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaConcepto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PruebaConcepto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaConcepto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PruebaConcepto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PruebaConcepto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaConcepto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaConcepto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaConcepto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaConcepto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaConcepto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaConcepto] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaConcepto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaConcepto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaConcepto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaConcepto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaConcepto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaConcepto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaConcepto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaConcepto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaConcepto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaConcepto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PruebaConcepto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaConcepto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaConcepto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaConcepto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaConcepto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaConcepto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaConcepto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaConcepto] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaConcepto] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaConcepto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaConcepto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaConcepto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaConcepto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaConcepto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PruebaConcepto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaConcepto', N'ON'
GO
ALTER DATABASE [PruebaConcepto] SET QUERY_STORE = ON
GO
ALTER DATABASE [PruebaConcepto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PruebaConcepto]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 10/3/2023 10:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaseArticulo]    Script Date: 10/3/2023 10:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaseArticulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBErrors]    Script Date: 10/3/2023 10:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBErrors](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventLog]    Script Date: 10/3/2023 10:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogDescription] [varchar](2000) NOT NULL,
	[PostIdUser] [int] NOT NULL,
	[PostIP] [varchar](64) NOT NULL,
	[PostTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/3/2023 10:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](16) NOT NULL,
	[Password] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 

INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (1, N'Bombillo', 1500.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (2, N'Mini-Bombillo', 150.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (3, N'Serrucho', 13600.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (4, N'Brocha', 2000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (5, N'Candado', 3000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (6, N'Cemento', 7000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (7, N'Cinta', 1500.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (8, N'Clavo', 150.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (9, N'Desatornillador', 1500.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (10, N'Ladrillo', 1500.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (11, N'Martillo', 3000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (12, N'Mini-Clavo', 130.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (13, N'Mini-Martillo', 3200.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (14, N'Puerta', 20000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (15, N'Rastrillo', 21300.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (16, N'Rodaja', 13100.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (17, N'Soplete', 12000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (18, N'Suavizante', 82500.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (19, N'Super-Clavo', 255.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (20, N'Taladro', 15000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (21, N'Tubo', 2000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (22, N'Mini-Brocha', 1000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (23, N'Baston', 6000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (24, N'Mazo', 8000.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (25, N'Cortador', 3400.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (26, N'Desfibrilador', 2560.0000)
INSERT [dbo].[Articulo] ([Id], [Nombre], [Precio]) VALUES (27, N'Mini-Aspiradora', 2020.0000)
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[DBErrors] ON 

INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 41, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-01T23:31:02.287' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (2, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 41, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-01T23:40:23.407' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (3, N'DESKTOP-38G492P\Usuario', 3902, 1, 16, 55, N'SP_InsertArticulo', N'The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.', CAST(N'2023-03-02T14:16:46.803' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (4, N'DESKTOP-38G492P\Usuario', 3902, 1, 16, 55, N'SP_InsertArticulo', N'The COMMIT TRANSACTION request has no corresponding BEGIN TRANSACTION.', CAST(N'2023-03-02T14:16:58.417' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (5, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:41:53.503' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (6, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:42:11.493' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1007, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T21:42:55.993' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1008, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 56, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T22:11:49.837' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1009, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 63, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T23:20:42.420' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (1010, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 63, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-03T23:22:08.567' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (7, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:51:50.153' AS DateTime))
INSERT [dbo].[DBErrors] ([ErrorID], [UserName], [ErrorNumber], [ErrorState], [ErrorSeverity], [ErrorLine], [ErrorProcedure], [ErrorMessage], [ErrorDateTime]) VALUES (8, N'DESKTOP-38G492P\Usuario', 547, 0, 16, 46, N'SP_InsertArticulo', N'The INSERT statement conflicted with the CHECK constraint "Nombre". The conflict occurred in database "PruebaConcepto", table "dbo.Articulo", column ''Nombre''.', CAST(N'2023-03-02T17:55:31.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[DBErrors] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarArticulo]    Script Date: 10/3/2023 10:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_InsertarArticulo]
	@inNombre VARCHAR(128)		-- Nuevo Nombre de articulo
	, @inPrecio MONEY				-- Nuevo Precio
	, @outResultCode INT OUTPUT			-- Codigo de resultado del SP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Se validan los datos de entrada, pues no estamos seguros que se validaron en capa logica.
	-- Validar que articulo exista.

	BEGIN TRY
		-- Inicia codigo en el cual se capturan errores
		
		SET @outResultCode=0;  -- Por default codigo de salida error en 0 significa que no hubo error

		IF ( -- Verificar que el nombre solo contenga guiones o valores alfabeticos
			@inNombre like '%[^A-Za-z-]%'
		)
		BEGIN 
			-- procesar error
			SET @outResultCode=50001		-- Articulo tiene caracteres invalidos
			RETURN;
		END;

		IF EXISTS (	-- Verificar por medio del nombre si el articulo ya existe
			SELECT 1 
			FROM dbo.Articulo A 
			WHERE A.Nombre=@inNombre
			)
		BEGIN
			-- procesar error
			SET @outResultCode=50002;		-- Articulo ya existe 
			RETURN;
		END; 

		IF  (--Verificar si el string del nombre es nulo o su cantidad de caracteres no es mayor que cero
			@inNombre IS NULL OR NOT LEN(@inNombre) > 0	
			)
		BEGIN
			-- procesar error
			SET @outResultCode=50003;		-- Codigo de salida del nombre no ingresado
			RETURN;
		END; 

		IF(--Verificar si el precio es un valor cero, es decir un valor mnonetario invalido 
			@inPrecio = 0					
			)
		BEGIN
			-- procesar error
			SET @outResultCode=50004;		-- Valor monetario invalido 
			RETURN;
		END; 

		-- siempre que vamos a actualizar tablas (y son 2 o mas tablas se inicia transaccion de BD)_
		BEGIN TRANSACTION tInsertArticulo
			
			INSERT [dbo].[Articulo] (
				[Nombre]
				, [Precio])
			VALUES (
				@inNombre
				, @inPrecio
			);

			-- salvamos en evento log el evento de actualizar el articulo
		COMMIT TRANSACTION tInsertArticulo

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT>0  -- error sucedio dentro de la transaccion
		BEGIN
			ROLLBACK TRANSACTION tInsertArticulo; -- se deshacen los cambios realizados
		END;
		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME()
			, ERROR_NUMBER()
			, ERROR_STATE()
			, ERROR_SEVERITY()
			, ERROR_LINE()
			, ERROR_PROCEDURE()
			, ERROR_MESSAGE()
			, GETDATE()
		);

		Set @outResultCode=50005;
	
	END CATCH

	SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarArticulos]    Script Date: 10/3/2023 10:59:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ListarArticulos]
	@inPatron VARCHAR(32)
	, @outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SET @outResultCode = 0;  -- no error code

		-- SE HACEN VALIDACIONES

		IF (@inPatron IS NULL)
		BEGIN
			SET @outResultCode = 50002;  -- parametro de entrada es nulo
			RETURN;
		END;

		SELECT A.[Nombre]
			, A.[Precio]
		FROM dbo.Articulo A
		WHERE A.Nombre LIKE '%'+@inPatron+'%'
		ORDER BY A.Nombre;

	END TRY
	BEGIN CATCH

		INSERT INTO dbo.DBErrors	VALUES (
			SUSER_SNAME()
			, ERROR_NUMBER()
			, ERROR_STATE()
			, ERROR_SEVERITY()
			, ERROR_LINE()
			, ERROR_PROCEDURE()
			, ERROR_MESSAGE()
			, GETDATE()
		);

		Set @outResultCode=50005;
	
	END CATCH


	SET NOCOUNT OFF;
END;
GO
USE [master]
GO
ALTER DATABASE [PruebaConcepto] SET  READ_WRITE 
GO
