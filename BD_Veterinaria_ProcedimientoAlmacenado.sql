-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BCliente]
	-- Add the parameters for the stored procedure here
	@nombreC varchar(30),
	@numerodni  int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Cliente.nombres_cliente, Cliente.dni, Cliente.email from Cliente 
	where Cliente.nombres_cliente like @nombreC and dni >= @numerodni
END
GO


DECLARE	@return_value int
EXEC	@return_value = [dbo].[BCliente]
		@nombreC = '%Ma%',
		@numerodni = '70000000'

SELECT	'Return Value' = @return_value
GO

exec BCliente '%Ma%','75000000'

drop Procedure BCliente 

/*FILA 2 PROCEDIMIENTO ALMACENADO*/