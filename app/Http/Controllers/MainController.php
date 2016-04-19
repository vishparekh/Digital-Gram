<?php 
namespace App\Http\Controllers;
use App\Model\Tmp;
use Auth;

class MainController extends Controller
{
	public function btc()
	{
		return view('pages.btc');
	}
	public function list1($pur=NULL)
	{
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		$b=Auth::user()->did;
		if($pur=="pending")
		{
			$pa=1;
			$a=Tmp::where('status','=',$b)->get();
			return view('pages.list1')->with(['a'=>$a,'pa'=>$pa]);
		}
		else if($pur=="accepted")
		{
			$pa=0;
			$a=Tmp::where('status','>',$b)->get();
			return view('pages.list1')->with(['a'=>$a,'pa'=>$pa]);
		}
		else if($pur=="rejected")
		{
			$pa=0;
			$a=Tmp::where('status','<',$b)->where('reje','=',Auth::user()->id)->get();
			return view('pages.list1')->with(['a'=>$a,'pa'=>$pa]);
		}
		else if($pur==NULL && Auth::user()->did==1)
		{
			$pa=0;
			$a=Tmp::where('status','>=',0)->get();
			return view('pages.list1')->with(['a'=>$a,'pa'=>$pa]);
		}
		else
		{
			abort(404);
		}
	}

	public function vie($id)
	{
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		$a=Auth::user();
		if($a->did===1)
		{
			$pa=1;
			$a=Tmp::where('id','=',$id)->where('status','=','5')->firstOrFail();
		}
		else
		{
			$pa=0;
			$a=Tmp::where('id','=',$id)->where('status','=',$a->did)->firstOrFail();
		}
		return view('pages.list')->with(['a'=>$a,'pa'=>$pa]);
	}

	public function getcp($id)
	{
		//$a=Tmp::where('id','=',$id)->firstOrFail()>with(['a'=>$a]);
		return view('pages.wtp');	
	}

	public function acc($it)
	{
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		$a=Tmp::where('id','=',$it)->firstOrFail();
		if($a->status==3)
		{
			$a->status=5;
		}
		else
		{
			$a->status=$a->status+1;
		}
		$a->save();
		return redirect()->route('list',['pur'=>"pending"]);
	}

	public function reg($it)
	{
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		$a=Tmp::where('id','=',$it)->firstOrFail();
		$a->status=0;
		$a->reje=Auth::user()->id;
		$a->save();
		return redirect()->route('list',['pur'=>"pending"]);
	}

	public function form()
	{
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		$msg=0;
		$id=4;
		return view('pages.form')->with(['msg'=>$msg,'id'=>$id]);
	}

	public function index()
	{
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		if(!Auth::check())
		{
			return view('pages.login');
		}
		$user=Auth::user();
		if($user->did==1)
		{
			return view('pages.index2');
		}
		return view('pages.index1');
	}
	public function login()
	{
		if(!Auth::check())
			return view('pages.login');
		else
			return \Redirect('/');
	}
	public function plogin()
	{
		$userdata = array(
       		'username'     	=> 	\Input::get('username'),
        	'password'  	=> 	\Input::get('password'),
    	);
		$a=Auth::attempt($userdata);
		if ($a) 
		{
			session()->regenerate();
        	Auth::viaRemember();
			return \Redirect('/');
   	 	} 
   	 	else 
   	 	{  
        	return \Redirect::to('login')->with('msg',"Incorrect E-mail Or password");      	
        }
	}


	public function logout()
	{

		if(Auth::check())
		{
			\Session::flush();
			Auth::logout();
    		return \Redirect::to('login'); 
		}
		else
		{
			return view('pages.login');
		}
	}


	public function temp()
	{
		$user=Auth::user();
		echo $user->did;
	}


	public function pform()
	{
		/*$rules=array(
			'firstname'	=>	'required|min:3|max:30',
			'lastname'	=>	'required|min:3|max:30',
			'username'	=>	'required|min:3|unique:users',
			'email'		=>	'required|email|unique:users',
			'password'	=>	'required|min:3',
			'cpass' 	=> 	'required|same:password',
			'mobile'	=>	'required|digits:10',
			'college'	=>	'required|min:2|max:50',
			);
		$validator=\Validator::make(\Input::all(),$rules);
		if($validator->fails())
		{
			return \Redirect::to('login')
        	->withErrors($validator) 
        	->withInput(\Input::except('password','cpass'));
		}*/
		if(!Auth::check())
		{
			return \Redirect::to('login'); 
		}
		$m= new Tmp();
		$m->name 				=	\Input::get('nm');
		$m->dob 				=	\Input::get('dob');
		$m->gen					=	"Male";
		$m->place  				= 	\Input::get('place');
		$m->fn  				= 	\Input::get('fn');
       	$m->mn    				= 	\Input::get('mn');
       	$m->nationality			=	\Input::get('nation');
       	$m->Religion			= 	\Input::get('relig');
       	$m->dname 				= 	\Input::get('dname');
       	$m->dphone  			= 	\Input::get('dname');
       	$m->phone				=	\Input::get('phone');
       	$m->addre				=	\Input::get('addre');
       	$m->doctype				=	\Input::get('doctype');
       	$m->status=2;
       	$temp = explode(".", $_FILES['pro']["name"]);
		$extension = end($temp);
		$m->extension=$extension;
		$m->save();
		$loc='C:\\xampp\\htdocs\\myapp\\public\\images\\pro\\'.$m->id.".".$extension;
		move_uploaded_file($_FILES['pro']["tmp_name"],$loc);
		$msg=1;
		$id=4;
       	return redirect()->route('form')->with(['msg'=>$msg,'id'=>$id]);
	}

	public function getdoc($id)
	{
		$a=Tmp::where('id','=',$id)->firstOrFail();
		$name = $id.".".$a->extension;
    	$file = 'C:\\xampp\\htdocs\\myapp\\public\\images\\pro\\'.$id.".".$a->extension;
    	$header = array(
				        'Content-Type' => 'application/octet-stream',
				        'Content-Disposition' => 'attachment', 
				        'Content-lenght' => filesize($file),
				        'filename' => $name,
				    );
 	   return \Response::download($file, $name, $header);
	}
}

?>