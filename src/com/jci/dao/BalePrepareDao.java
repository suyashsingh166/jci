package com.jci.dao;

import java.util.List;

import com.jci.model.BalePreparation;

public interface BalePrepareDao {

	public void create(BalePreparation BalePreparation);
	public void update(BalePreparation BalePreparation);
	public BalePreparation edit(int id);
	public void delete(int id);
	public BalePreparation find(int id);
	public List <BalePreparation> getAll(String place_of_packing, String regionId, String zoneId);
	public boolean submitform(BalePreparation BalePreparation);
	public List<BalePreparation> getbyFilter(String dpc,String fromdate,  String todate,  String cropyear, String basis, String jutevariety);
	public String getcropYear(String cropyear);
	public String getjuteVariety(String juteVariety);
	public String getbasis(String basis);
	public List<BalePreparation> RegionWiseData(String roname, String fromdate, String purchasesdateTo, String cropyear,
			String basis, String juteVariety);
	public List<BalePreparation> DpcWiseData(String purchasesdateFrom, String purchasesdateTo,
			String cropyear, String basis, String juteVariety, String dpc);
	public String regionId(String roname);
	public List<BalePreparation> allBaleDataList(String purchasesdateFrom, String purchasesdateTo, String cropyear, String basis,
			String juteVariety);

}
