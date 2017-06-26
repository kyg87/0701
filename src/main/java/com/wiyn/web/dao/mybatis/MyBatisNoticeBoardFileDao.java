package com.wiyn.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.wiyn.web.dao.NoticeBoardFileDao;
import com.wiyn.web.entity.NoticeFile;

public class MyBatisNoticeBoardFileDao implements NoticeBoardFileDao{

   @Autowired
   private SqlSession sqlSession;
   
   @Override
   public List<NoticeFile> getList() {
      
	  NoticeBoardFileDao noticeBoardFileDao;
	  noticeBoardFileDao = sqlSession.getMapper(NoticeBoardFileDao.class);
      
      return noticeBoardFileDao.getList();
   }

   @Override
   public int add(NoticeFile file) {
	  NoticeBoardFileDao noticeBoardFileDao;
	  noticeBoardFileDao = sqlSession.getMapper(NoticeBoardFileDao.class);
      
      return noticeBoardFileDao.add(file);
   }

	@Override
	public NoticeFile get(String noticeBoardId) {
		NoticeBoardFileDao noticeBoardFileDao;
		noticeBoardFileDao = sqlSession.getMapper(NoticeBoardFileDao.class);

		return noticeBoardFileDao.get(noticeBoardId);
	}

	@Override
	public int update(NoticeFile file) {
		NoticeBoardFileDao noticeBoardFileDao;
		noticeBoardFileDao = sqlSession.getMapper(NoticeBoardFileDao.class);
		
	    return noticeBoardFileDao.update(file);
	}


}