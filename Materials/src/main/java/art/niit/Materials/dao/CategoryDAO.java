package art.niit.Materials.dao;

import java.util.List;

import art.niit.Materials.dto.Category;


public interface CategoryDAO {

	
	
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	
}
