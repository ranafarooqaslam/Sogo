using System;
using System.Data;
using SAMSCommon.Classes;
using SAMSDataAccessLayer.Classes;


namespace SAMSDatabaseLayer.Classes
{
	public class spDailyCollectionSummary
	{
		#region Private Members
		private string sp_Name = "spDailyCollectionSummary" ;
		private IDbConnection m_connection;
		private IDbTransaction m_transaction;
		private int m_distributorId;
		private int m_businessType;
		private int m_sectorId;
		private int m_region_id;
		private int m_townId;
		private int m_type;
		private DateTime m_fromDate;
		private DateTime m_toDate;
		private long m_customerId;
        private int m_userId;
        #endregion
        #region Public Properties
        public int userId
        {
            set
            {
                m_userId = value;
            }
            get
            {
                return m_userId;
            }
        }
        public int distributorId
		{
			set
			{
				m_distributorId = value ;
			}
			get
			{
				return m_distributorId;
			}
		}
		    public int businessType
		    {
			    set
			    {
				    m_businessType = value ;
			    }
			    get
			    {
				    return m_businessType;
			    }
		    }
		    public int sectorId
		    {
			    set
			    {
				    m_sectorId = value ;
			    }
			    get
			    {
				    return m_sectorId;
			    }
		    }
		    public int region_id
		    {
			    set
			    {
				    m_region_id = value ;
			    }
			    get
			    {
				    return m_region_id;
			    }
		    }
		    public int townId
		    {
			    set
			    {
				    m_townId = value ;
			    }
			    get
			    {
				    return m_townId;
			    }
		    }
		public int type
		{
			set
			{
				m_type = value ;
			}
			get
			{
				return m_type;
			}
		}
		public DateTime fromDate
		{
			set
			{
				m_fromDate = value ;
			}
			get
			{
				return m_fromDate;
			}
		}
		public DateTime toDate
		{
			set
			{
				m_toDate = value ;
			}
			get
			{
				return m_toDate;
			}
		}
		public long customerId
		{
			set
			{
				m_customerId = value ;
			}
			get
			{
				return m_customerId;
			}
		}


		public IDbConnection  Connection
		{
			set
			{
				m_connection = value;
			}
			get
			{
				return m_connection;
			}
		}
		public IDbTransaction  Transaction
		{
			set
			{
				m_transaction = value;
			}
			get
			{
				return m_transaction;
			}
		}
		#endregion
		#region Constructor
		public spDailyCollectionSummary()
		{
		}
		#endregion
		#region public Methods
		public bool  ExecuteQuery()
		{
			try
			{
			    IDbCommand cmd = ProviderFactory.GetCommand(EnumProviders.SQLClient);
				cmd.CommandType =  CommandType.StoredProcedure;
				cmd.CommandText = sp_Name;
				cmd.Connection =   m_connection;
				if(m_transaction!=null)
				{
					cmd.Transaction = m_transaction;
				}
				GetParameterCollection(ref cmd);
				cmd.ExecuteNonQuery();
				return true;
			}
			catch(Exception e)
			{
				throw e;
			}
			finally
			{
			}
		}
		public IDataReader ExecuteReader()
		{
			try
			{
				IDbCommand command = ProviderFactory.GetCommand(EnumProviders.SQLClient);
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = sp_Name;
				command.Connection = m_connection;
				if(m_transaction!=null)
				{
					command.Transaction = m_transaction;
				}
				GetParameterCollection(ref command);
				IDataReader dr = command.ExecuteReader();
				return dr;
			}
			catch(Exception exp)
			{
				throw exp;
			}
			finally
			{
			}
		}
		public DataTable ExecuteTable()
		{
			try
			{
				IDbCommand command = ProviderFactory.GetCommand(EnumProviders.SQLClient);
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = sp_Name;
				command.Connection = m_connection;
                command.CommandTimeout = 0;
				if(m_transaction!=null)
				{
					command.Transaction = m_transaction;
				}
				GetParameterCollection(ref command);
				IDbDataAdapter da = ProviderFactory.GetAdapter(EnumProviders.SQLClient);
				da.SelectCommand = command;
				DataSet ds = new DataSet();
				da.Fill(ds);
				return ds.Tables[0];
			}
			catch(Exception exp)
			{
				throw exp;
			}
			finally
			{
			}
		}
		public string ExecuteScalar()
		{
			try
			{
				IDbCommand command = ProviderFactory.GetCommand(EnumProviders.SQLClient);
				command.CommandType = CommandType.StoredProcedure;
				command.CommandText = sp_Name;
				command.Connection = m_connection;
				if(m_transaction!=null)
				{
					command.Transaction = m_transaction;
				}
				GetParameterCollection(ref command);
				object o;
				o = command.ExecuteScalar();


				return o.ToString();
			}
			catch(Exception exp)
			{
				throw exp;
			}
			finally
			{
			}
		}
		public void FirstReader(IDataReader dr)
		{
			if(dr.Read())
			{
				m_distributorId= Convert.ToInt32(dr["distributorId"]);
				m_businessType= Convert.ToInt32(dr["businessType"]);
				m_sectorId= Convert.ToInt32(dr["sectorId"]);
				m_region_id= Convert.ToInt32(dr["region_id"]);
				m_townId= Convert.ToInt32(dr["townId"]);
				m_type= Convert.ToInt32(dr["type"]);
				m_fromDate= Convert.ToDateTime(dr["fromDate"]);
				m_toDate= Convert.ToDateTime(dr["toDate"]);
				m_customerId=Convert.ToInt64(dr["customerId"]);
			}
		}
		public void GetParameterCollection(ref IDbCommand cmd)
		{
			IDataParameterCollection pparams = cmd.Parameters;
			IDataParameter parameter ;
			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@distributorId" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
			if(m_distributorId==Constants.IntNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_distributorId;
			}
			pparams.Add(parameter);

            parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
            parameter.ParameterName = "@userId";
            parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
            if (m_userId == Constants.IntNullValue)
            {
                parameter.Value = DBNull.Value;
            }
            else
            {
                parameter.Value = m_userId;
            }
            pparams.Add(parameter);

            parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@businessType" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
			if(m_businessType==Constants.IntNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_businessType;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@sectorId" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
			if(m_sectorId==Constants.IntNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_sectorId;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@region_id" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
			if(m_region_id==Constants.IntNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_region_id;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@townId" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
			if(m_townId==Constants.IntNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_townId;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@type" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.Int);
			if(m_type==Constants.IntNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_type;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@fromDate" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.DateTime);
			if(m_fromDate==Constants.DateNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_fromDate;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@toDate" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.DateTime);
			if(m_toDate==Constants.DateNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_toDate;
			}
			pparams.Add(parameter);


			parameter = ProviderFactory.GetParameter(EnumProviders.SQLClient);
			parameter.ParameterName = "@customerId" ; 
			parameter.DbType = ProviderFactory.GetDBType(EnumProviders.SQLClient, EnumDBTypes.BigInt);
			if(m_customerId==Constants.LongNullValue)
			{
				parameter.Value = DBNull.Value;
			}
			else
			{
				parameter.Value = m_customerId;
			}
			pparams.Add(parameter);


		}
		#endregion
	}
}
