package com.kh.ddoda.calorie.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ddoda.calorie.domain.Calorie;
import com.kh.ddoda.common.PageInfo;

@Repository
public class CalorieStoreLogic implements CalorieStore {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getCalorieListCount() {
		return sqlSession.selectOne("CalorieMapper.getCalorieListCount");
	}

	@Override
	public ArrayList<Calorie> adminCalorieList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("CalorieMapper.adminCalorieList", null, rowBounds);
	}

	@Override
	public Calorie adminSelectCalorie(int calorieNo) {
		return sqlSession.selectOne("CalorieMapper.adminSelectCalorie", calorieNo);
	}

	@Override
	public int adminInsertCalorie(Calorie calorie) {
		return sqlSession.insert("CalorieMapper.adminCalorieInsert", calorie);
	}

	@Override
	public int adminModifyCalorie(Calorie calorie) {
		return sqlSession.update("CalorieMapper.adminUpdateCalorie", calorie);
	}

	@Override
	public int adminDeleteCalorie(int calorieNo) {
		return sqlSession.delete("CalorieMapper.adminDeleteCalorie", calorieNo);
	}
}