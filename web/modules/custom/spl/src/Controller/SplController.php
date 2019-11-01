<?php
/**
 * @file
 * Contains \Drupal\spl\Controller\SplController.
 */
namespace Drupal\spl\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Drupal\eventsreg\Utility\DescriptionTemplateTrait;

/**
 * Controller routines for page example routes.
 */
class SplController extends ControllerBase {

  //use DescriptionTemplateTrait;

  /**
   * {@inheritdoc}
   */
  protected function getModuleName() {
    return 'spl';
  }

  public function NonSplUser() {

    \Drupal::service('page_cache_kill_switch')->trigger();
    
      $build = [];

      // CSS and JavaScript libraries can be attached to elements in a renderable
      // array. This way, if the element ends up being rendered and displayed you
      // know for sure the CSS/JavaScript will also be included. But, if for
      // some reason the element isn't ever rendered then Drupal can skip the
      // unnecessary extra files.
      //
      // Learn more about attaching CSS and JavaScript libraries with the
      // #attached property here:
      // https://api.drupal.org/api/drupal/core%21lib%21Drupal%21Core%21Render%21theme.api.php/group/theme_render/#sec_attached
   
      $build['#attached'] = [
        'library' => [
          'spl/non-spl-user.library',
        ],
      ];

      $build['#markup'] = "Hello There";
      $build['#markup'] = $this->getNonSplUserHTML();
      
      $build['#cache'] =  ['max-age' => 0,];   //Set cache for 0 seconds.

      return $build;
      /*    
      return array(
        '#type' => 'markup',
        '#markup' => t('Hello, You are a Non SPL user and do not have access to the contents of this website.  <br> Thanks for your participation.<br>'),
      );
      */
  }

  public function getNonSplUserHTML() {
    $twig = \Drupal::service('twig');
    // Load the current user.
    $user_entity = \Drupal\user\Entity\User::load(\Drupal::currentUser()->id());

    // retrieve field data from that user

    $user['email'] = $user_entity->get('mail')->value;
    $user['name'] = $user_entity->get('name')->value;
    $user['uid'] = $user_entity->get('uid')->value;
    $user['roles'] = $user_entity->getRoles();

    $template = $twig->loadTemplate('modules/custom/spl/templates/non-spl-user.html.twig');
    $response = $template->render(["user" => $user]);

    return $response;
  }

}