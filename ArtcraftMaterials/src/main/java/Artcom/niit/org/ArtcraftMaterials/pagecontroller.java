package Artcom.niit.org.ArtcraftMaterials;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class pagecontroller {
	//@Autowired
//	private Category categoryDAO;
	
  @RequestMapping(value={"/","/home", "/index"})
    public ModelAndView index() {
         ModelAndView mv= new ModelAndView("homepage");
         mv.addObject("title","home");
         //passing the list of categories
         //mv.addObject("categories",categoryDAO.list());
        
         mv.addObject("userclickhome",true);
         return mv;
     }
  @RequestMapping(value="/about")
  public ModelAndView about() {
       ModelAndView mv= new ModelAndView("homepage");
       mv.addObject("title","about us");
       mv.addObject("userclickhome",true);
       return mv;
  }
  @RequestMapping(value="/contact")
  public ModelAndView contact() {
       ModelAndView mv= new ModelAndView("homepage");
       mv.addObject("title","contact us");
       mv.addObject("userclickhome",true);
       return mv;
       
      
}
  
}