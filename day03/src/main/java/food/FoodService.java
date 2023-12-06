package food;

import java.util.ArrayList;
import java.util.List;

public class FoodService {
	
	private ArrayList<FoodDTO> list = new ArrayList<>();
	
	
	
	public int add(FoodDTO dto) {			//	데이터를 추가하는 기능
		int row = 0;
		row += list.add(dto) ? 1 : 0;
		return row;
	}
	
	
	public List<FoodDTO> getList() {		//	리스트를 받아오는 기능
		return list;
	}

	
	
}
