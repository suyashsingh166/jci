package com.jci.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.jci.model.Contractgeneration;
import com.jci.model.DailyReportDTO;
import com.jci.model.FarmerRegModel;
import com.jci.model.LedgerReportDTO;
import com.jci.model.PurchaseReportDTO;

@Service
public interface PurchaseReportService {

	public String finddpcbyid(String id);
	public String fname(String id);
	public List<LedgerReportDTO> LedgerReportList(String basis,String cropyr, String farmer);
    public List<String> farmerdetail(String F_NAME);
	public List<DailyReportDTO> RegionReportList( String Basis,String Jute_Variety, String Crop_Year,String From_date,String To_date);
	public List<DailyReportDTO> DailyReportList( String Basis,String Jute_Variety, String Crop_Year,String From_date,String To_date,String region);
	public List<PurchaseReportDTO> PurchaseReportList( String DPC, String Basis,String Jute_Variety, String Crop_Year, String From_date,String To_date);


	

}
